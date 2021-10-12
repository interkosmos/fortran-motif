! www.f90
!
! Example that displays HTML 3.2 content in the XmHTML widget.
! Link with `-lXpm -lXmHTML`.
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding
    use :: xm
    use :: xmhtml
    use :: xt
    implicit none

    integer, parameter :: WINDOW_MIN_HEIGHT = 200
    integer, parameter :: WINDOW_MIN_WIDTH  = 320
    integer, parameter :: WINDOW_HEIGHT     = 300
    integer, parameter :: WINDOW_WIDTH      = 400

    character(len=*), parameter :: HTML = &
        '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">&
        &<HTML>&
        &<HEAD>&
        &<TITLE>Example<TITLE>&
        &</HEAD>&
        &<BODY>&
        &<H1>Hello, from Fortran!</H1>&
        &<P><FONT color="Purple"><B>Welcome</B></FONT> to wherever you are.</P>&
        &</BODY>&
        &</HTML>'

    character(len=17), target :: window_title = 'Fortran + XmHTML' // c_null_char
    type(c_ptr)               :: app_ptr
    type(c_ptr)               :: form_ptr
    type(c_ptr)               :: locale_ptr
    type(c_ptr)               :: widget_ptr
    type(c_ptr)               :: window_ptr
    type(xt_arg),      target :: args(5)

    ! Set locale.
    locale_ptr = xt_set_language_proc(c_null_ptr, c_null_ptr, c_null_ptr)

    ! Create Xt window.
    call xt_set_arg(args(1), XM_N_TITLE,      c_loc(window_title))
    call xt_set_arg(args(2), XM_N_HEIGHT,     WINDOW_HEIGHT)
    call xt_set_arg(args(3), XM_N_WIDTH,      WINDOW_WIDTH)
    call xt_set_arg(args(4), XM_N_MIN_HEIGHT, WINDOW_MIN_HEIGHT)
    call xt_set_arg(args(5), XM_N_MIN_WIDTH,  WINDOW_MIN_WIDTH)

    window_ptr = xt_open_application(app_ptr, &                         ! Application context.
                                     'FortranApp' // c_null_char, &     ! Class name of this application.
                                     c_null_ptr, &                      ! Options description.
                                     0, &                               ! Number of entries in the options list.
                                     0, &                               ! Number of command line parameters.
                                     c_null_ptr, &                      ! Command line parameters.
                                     c_null_ptr, &                      ! Fallback resources.
                                     APPLICATION_SHELL_WIDGET_CLASS, &  ! Widget class.
                                     c_loc(args), &                     ! Argument list.
                                     5)                                 ! Number of arguments in argument list.

    ! Create XmForm widget.
    call xt_set_arg(args(1), XM_N_MARGIN_HEIGHT, 25)
    call xt_set_arg(args(2), XM_N_MARGIN_WIDTH,  25)

    form_ptr = xt_create_managed_widget('Form' // c_null_char, &        ! Class name.
                                        XM_FORM_WIDGET_CLASS, &         ! Widget class.
                                        window_ptr, &                   ! Parent.
                                        c_loc(args), &                  ! Argument list.
                                        2)                              ! Number of entries in argument list.

    ! Create XmForm widget.
    widget_ptr = create_xmhtml_widget(form_ptr)

    call xt_set_arg(args(1), XM_N_BOTTOM_ATTACHMENT, XM_ATTACH_FORM)
    call xt_set_arg(args(2), XM_N_LEFT_ATTACHMENT,   XM_ATTACH_FORM)
    call xt_set_arg(args(3), XM_N_RIGHT_ATTACHMENT,  XM_ATTACH_FORM)
    call xt_set_arg(args(4), XM_N_TOP_ATTACHMENT,    XM_ATTACH_FORM)

    call xt_set_values(widget_ptr, c_loc(args), 4)

    ! Set widget contents.
    call xm_html_text_set_string(widget_ptr, HTML // c_null_char)

    ! Show window.
    call xt_realize_widget(window_ptr)

    ! Run main loop.
    call xt_app_main_loop(app_ptr)
contains
    function create_xmhtml_widget(parent) result(widget)
        type(c_ptr), intent(in) :: parent
        type(c_ptr)             :: widget
        type(xt_arg), target    :: args(6)

        call xt_set_arg(args(1), XM_N_ENABLE_BAD_HTML_WARNINGS, 0)  ! Parser warnings to stderr.
        call xt_set_arg(args(2), XM_N_IMAGE_ENABLE,             0)  ! Display images.
        call xt_set_arg(args(3), XM_N_SMOOTH_SCROLLING,         0)  ! Smooth scrolling.
        call xt_set_arg(args(4), XM_N_ANCHOR_BUTTONS,           0)  ! Anchors as buttons.
        call xt_set_arg(args(5), XM_N_MARGIN_HEIGHT,            10) ! Margin at the top and bottom of the display area.
        call xt_set_arg(args(6), XM_N_MARGIN_WIDTH,             10) ! Margin at the right and left of the display area.

        widget = xt_create_managed_widget('HTML' // c_null_char, &
                                          XM_HTML_WIDGET_CLASS, &
                                          parent, &
                                          c_loc(args), &
                                          size(args))
    end function create_xmhtml_widget
end program main
