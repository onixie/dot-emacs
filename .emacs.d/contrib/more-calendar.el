(defvar calendars-displayed-count
  (- (* (/ (/ (display-pixel-width)
	      (* (+ (* 7 calendar-column-width)
		    calendar-intermonth-spacing
		    calendar-left-margin
		    )
		 (frame-char-width))) 
	   2) 
	2) 
     1))

(defun calendar-generate (month year)
  "Generate a three-month Gregorian calendar centered around MONTH, YEAR."
  ;; A negative YEAR is interpreted as BC; -1 being 1 BC, and so on.
  ;; Note that while calendars for years BC could be displayed as it
  ;; stands, almost all other calendar functions (eg holidays) would
  ;; at best have unpredictable results for such dates.
  (if (< (+ month (* 12 (1- year))) 2)
      (error "Months before January, 1 AD cannot be displayed"))
  (setq displayed-month month
        displayed-year year)
  (erase-buffer)
  (calendar-increment-month month year (- (/ (1- calendars-displayed-count) 2)))
  (dotimes (i calendars-displayed-count)
    (calendar-generate-month month year
                             (+ calendar-left-margin
                                (* calendar-month-width i)))
    (calendar-increment-month month year 1)))

(defun calendar-recompute-layout-variables ()
  "Recompute some layout-related calendar \"constants\"."
  (setq calendar-month-digit-width (+ (* 6 calendar-column-width)
                                      calendar-day-digit-width)
        calendar-month-width (+ (* 7 calendar-column-width)
                                calendar-intermonth-spacing)
        calendar-right-margin (+ calendar-left-margin
                                   (* calendars-displayed-count (* 7 calendar-column-width))
                                   (* (1- calendars-displayed-count) calendar-intermonth-spacing))
        calendar-month-edges nil)
  (dotimes (i calendars-displayed-count)
    (push (cons i (calendar-month-edges i)) calendar-month-edges))
  (setq calendar-month-edges (reverse calendar-month-edges)))

(defun calendar-scroll-left-three-months (arg &optional event)
  "Scroll the displayed calendar window left by 3*ARG months.
If ARG is negative the calendar is scrolled right.  Maintains the relative
position of the cursor with respect to the calendar as well as possible.
EVENT is an event like `last-nonmenu-event'."
  (interactive (list (prefix-numeric-value current-prefix-arg)
                     last-nonmenu-event))
  (calendar-scroll-left (* calendars-displayed-count arg) event))

(defun calendar-scroll-right-three-months (arg &optional event)
  "Scroll the displayed calendar window right by 3*ARG months.
If ARG is negative the calendar is scrolled left.  Maintains the relative
position of the cursor with respect to the calendar as well as possible.
EVENT is an event like `last-nonmenu-event'."
  (interactive (list (prefix-numeric-value current-prefix-arg)
                     last-nonmenu-event))
  (calendar-scroll-left (* (- calendars-displayed-count) arg) event))

(defconst cal-menu-scroll-menu
  '("Scroll"
    ["Scroll Commands" nil :help "Commands that scroll the visible window"]
    ["Forward 1 Month" calendar-scroll-left]
    ["Forward n Months" calendar-scroll-left-three-months]
    ["Forward 1 Year" (calendar-scroll-left 12) :keys "4 C-v"]
    ["Backward 1 Month" calendar-scroll-right]
    ["Backward n Months" calendar-scroll-right-three-months]
    ["Backward 1 Year" (calendar-scroll-right 12) :keys "4 M-v"]
    "--"
    ["Motion Commands" nil :help "Commands that move point"]
    ["Forward 1 Day" calendar-forward-day]
    ["Forward 1 Week" calendar-forward-week]
    ["Forward 1 Month" calendar-forward-month]
    ["Forward 1 Year" calendar-forward-year]
    ["Backward 1 Day" calendar-backward-day]
    ["Backward 1 Week" calendar-backward-week]
    ["Backward 1 Month" calendar-backward-month]
    ["Backward 1 Year" calendar-backward-year])
  "Key map for \"Scroll\" menu in the calendar.")

(defun calendar-date-is-visible-p (date)
  "Return non-nil if DATE is valid and is visible in the calendar window."
  (and (calendar-date-is-valid-p date)
       (< (abs (calendar-interval
                displayed-month displayed-year
                (calendar-extract-month date) (calendar-extract-year date)))
          (1+ (/ (1- calendars-displayed-count) 2)))))

(defun calendar-cursor-to-date (&optional error event)
  "Return a list (month day year) of current cursor position.
If cursor is not on a specific date, signals an error if optional parameter
ERROR is non-nil, otherwise just returns nil.
If EVENT is non-nil, it's an event indicating the buffer position to
use instead of point."
  (with-current-buffer
      (if event (window-buffer (posn-window (event-start event)))
        (current-buffer))
    (save-excursion
      (and event (setq event (event-start event))
           (goto-char (posn-point event)))
      (let* ((segment (calendar-column-to-segment))
             (month (% (+ displayed-month (+ 12 (- segment (/ (1- calendars-displayed-count) 2)))) 12)))
        ;; Call with point on either of the two digits in a 2-digit date,
        ;; or on or before the digit of a 1-digit date.
        (if (not (and (looking-at "[ 0-9]?[0-9][^0-9]")
                      (get-text-property (point) 'date)))
            (if error (error "Not on a date!"))
          ;; Convert segment to real month and year.
          (if (zerop month) (setq month 12))
          ;; Go back to before the first date digit.
          (or (looking-at " ")
              (re-search-backward "[^0-9]"))
          (list month
                (string-to-number
                 (buffer-substring (1+ (point))
                                   (+ 1 calendar-day-digit-width (point))))
                (cond
                 ((> 1 (+ displayed-month (- segment (/ (1- calendars-displayed-count) 2)))) (1- displayed-year))
                 ((< 12 (+ displayed-month (- segment (/ (1- calendars-displayed-count) 2)))) (1+ displayed-year))
                 (t displayed-year))))))))

(defun calendar-cursor-to-visible-date (date)
  "Move the cursor to DATE that is on the screen."
  (let ((month (calendar-extract-month date))
        (day (calendar-extract-day date))
        (year (calendar-extract-year date)))
    (goto-char (point-min))
    (forward-line (+ calendar-first-date-row -1
                     (/ (+ day -1
                           (mod
                            (- (calendar-day-of-week (list month 1 year))
                               calendar-week-start-day)
                            7))
                        7)))
    (move-to-column (+ calendar-left-margin (1- calendar-day-digit-width)
                       (* calendar-month-width
                          (+ (calendar-interval
                               displayed-month displayed-year month year) (/ (1- calendars-displayed-count) 2)))
                       (* calendar-column-width
                          (mod
                           (- (calendar-day-of-week date)
                              calendar-week-start-day)
                           7))))))


