! xlib.f90
!
! Fortran 2008 ISO C binding interfaces to X11.
!
! Author:  Philipp Engel
! Licence: ISC
module xlib
    use, intrinsic :: iso_c_binding
    implicit none
    public :: x_create_font_cursor
    public :: x_define_cursor
    public :: x_flush
    public :: x_init_threads
    public :: x_undefine_cursor

    integer(kind=c_int), parameter, public :: XC_X_CURSOR            = 0
    integer(kind=c_int), parameter, public :: XC_ARROW               = 2
    integer(kind=c_int), parameter, public :: XC_BASED_ARROW_DOWN    = 4
    integer(kind=c_int), parameter, public :: XC_BASED_ARROW_UP      = 6
    integer(kind=c_int), parameter, public :: XC_BOAT                = 8
    integer(kind=c_int), parameter, public :: XC_BOGOSITY            = 10
    integer(kind=c_int), parameter, public :: XC_BOTTOM_LEFT_CORNER  = 12
    integer(kind=c_int), parameter, public :: XC_BOTTOM_RIGHT_CORNER = 14
    integer(kind=c_int), parameter, public :: XC_BOTTOM_SIDE         = 16
    integer(kind=c_int), parameter, public :: XC_BOTTOM_TEE          = 18
    integer(kind=c_int), parameter, public :: XC_BOX_SPIRAL          = 20
    integer(kind=c_int), parameter, public :: XC_CENTER_PTR          = 22
    integer(kind=c_int), parameter, public :: XC_CIRCLE              = 24
    integer(kind=c_int), parameter, public :: XC_CLOCK               = 26
    integer(kind=c_int), parameter, public :: XC_COFFEE_MUG          = 28
    integer(kind=c_int), parameter, public :: XC_CROSS               = 30
    integer(kind=c_int), parameter, public :: XC_CROSS_REVERSE       = 32
    integer(kind=c_int), parameter, public :: XC_CROSSHAIR           = 34
    integer(kind=c_int), parameter, public :: XC_DIAMOND_CROSS       = 36
    integer(kind=c_int), parameter, public :: XC_DOT                 = 38
    integer(kind=c_int), parameter, public :: XC_DOTBOX              = 40
    integer(kind=c_int), parameter, public :: XC_DOUBLE_ARROW        = 42
    integer(kind=c_int), parameter, public :: XC_DRAFT_LARGE         = 44
    integer(kind=c_int), parameter, public :: XC_DRAFT_SMALL         = 46
    integer(kind=c_int), parameter, public :: XC_DRAPED_BOX          = 48
    integer(kind=c_int), parameter, public :: XC_EXCHANGE            = 50
    integer(kind=c_int), parameter, public :: XC_FLEUR               = 52
    integer(kind=c_int), parameter, public :: XC_GOBBLER             = 54
    integer(kind=c_int), parameter, public :: XC_GUMBY               = 56
    integer(kind=c_int), parameter, public :: XC_HAND1               = 58
    integer(kind=c_int), parameter, public :: XC_HAND2               = 60
    integer(kind=c_int), parameter, public :: XC_HEART               = 62
    integer(kind=c_int), parameter, public :: XC_ICON                = 64
    integer(kind=c_int), parameter, public :: XC_IRON_CROSS          = 66
    integer(kind=c_int), parameter, public :: XC_LEFT_PTR            = 68
    integer(kind=c_int), parameter, public :: XC_LEFT_SIDE           = 70
    integer(kind=c_int), parameter, public :: XC_LEFT_TEE            = 72
    integer(kind=c_int), parameter, public :: XC_LEFTBUTTON          = 74
    integer(kind=c_int), parameter, public :: XC_LL_ANGLE            = 76
    integer(kind=c_int), parameter, public :: XC_LR_ANGLE            = 78
    integer(kind=c_int), parameter, public :: XC_MAN                 = 80
    integer(kind=c_int), parameter, public :: XC_MIDDLEBUTTON        = 82
    integer(kind=c_int), parameter, public :: XC_MOUSE               = 84
    integer(kind=c_int), parameter, public :: XC_PENCIL              = 86
    integer(kind=c_int), parameter, public :: XC_PIRATE              = 88
    integer(kind=c_int), parameter, public :: XC_PLUS                = 90
    integer(kind=c_int), parameter, public :: XC_QUESTION_ARROW      = 92
    integer(kind=c_int), parameter, public :: XC_RIGHT_PTR           = 94
    integer(kind=c_int), parameter, public :: XC_RIGHT_SIDE          = 96
    integer(kind=c_int), parameter, public :: XC_RIGHT_TEE           = 98
    integer(kind=c_int), parameter, public :: XC_RIGHTBUTTON         = 100
    integer(kind=c_int), parameter, public :: XC_RTL_LOGO            = 102
    integer(kind=c_int), parameter, public :: XC_SAILBOAT            = 104
    integer(kind=c_int), parameter, public :: XC_SB_DOWN_ARROW       = 106
    integer(kind=c_int), parameter, public :: XC_SB_H_DOUBLE_ARROW   = 108
    integer(kind=c_int), parameter, public :: XC_SB_LEFT_ARROW       = 110
    integer(kind=c_int), parameter, public :: XC_SB_RIGHT_ARROW      = 112
    integer(kind=c_int), parameter, public :: XC_SB_UP_ARROW         = 114
    integer(kind=c_int), parameter, public :: XC_SB_V_DOUBLE_ARROW   = 116
    integer(kind=c_int), parameter, public :: XC_SHUTTLE             = 118
    integer(kind=c_int), parameter, public :: XC_SIZING              = 120
    integer(kind=c_int), parameter, public :: XC_SPIDER              = 122
    integer(kind=c_int), parameter, public :: XC_SPRAYCAN            = 124
    integer(kind=c_int), parameter, public :: XC_STAR                = 126
    integer(kind=c_int), parameter, public :: XC_TARGET              = 128
    integer(kind=c_int), parameter, public :: XC_TCROSS              = 130
    integer(kind=c_int), parameter, public :: XC_TOP_LEFT_ARROW      = 132
    integer(kind=c_int), parameter, public :: XC_TOP_LEFT_CORNER     = 134
    integer(kind=c_int), parameter, public :: XC_TOP_RIGHT_CORNER    = 136
    integer(kind=c_int), parameter, public :: XC_TOP_SIDE            = 138
    integer(kind=c_int), parameter, public :: XC_TOP_TEE             = 140
    integer(kind=c_int), parameter, public :: XC_TREK                = 142
    integer(kind=c_int), parameter, public :: XC_UL_ANGLE            = 144
    integer(kind=c_int), parameter, public :: XC_UMBRELLA            = 146
    integer(kind=c_int), parameter, public :: XC_UR_ANGLE            = 148
    integer(kind=c_int), parameter, public :: XC_WATCH               = 150
    integer(kind=c_int), parameter, public :: XC_XTERM               = 152

    interface
        ! Cursor XCreateFontCursor(Display *display, unsigned int shape)
        function x_create_font_cursor(display, shape) bind(c, name='XCreateFontCursor')
            import :: c_int, c_long, c_ptr
            type(c_ptr),         intent(in), value :: display
            integer(kind=c_int), intent(in), value :: shape
            integer(kind=c_long)                   :: x_create_font_cursor
        end function x_create_font_cursor

        ! int XDefineCursor(Display *display, Window w, Cursor cursor)
        function x_define_cursor(display, w, cursor) bind(c, name='XDefineCursor')
            import :: c_int, c_long, c_ptr
            type(c_ptr),          intent(in), value :: display
            type(c_ptr),          intent(in), value :: w
            integer(kind=c_long), intent(in), value :: cursor
            integer(kind=c_int)                     :: x_define_cursor
        end function x_define_cursor

        ! int XFlush(Display *display)
        function x_flush(display) bind(c, name='XFlush')
            import :: c_int, c_ptr
            type(c_ptr), intent(in), value :: display
            integer(kind=c_int)            :: x_flush
        end function x_flush

        ! Status XInitThreads(void)
        function x_init_threads() bind(c, name='XInitThreads')
            import :: c_int
            integer(kind=c_int) :: x_init_threads
        end function x_init_threads

        ! int XUndefineCursor(Display *display, Window w)
        function x_undefine_cursor(display, w) bind(c, name='XUndefineCursor')
            import :: c_int, c_ptr
            type(c_ptr),          intent(in), value :: display
            type(c_ptr),          intent(in), value :: w
            integer(kind=c_int)                     :: x_undefine_cursor
        end function x_undefine_cursor
    end interface
end module xlib
