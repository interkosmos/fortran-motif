! click.f90
!
! Example Fortran application that shows an XmPushButton widget inside a Motif
! window.
!
! Author:  Philipp Engel
! Licence: ISC
module callback
    use, intrinsic :: iso_c_binding
    use :: xm
    use :: xt
    implicit none
    private
    public :: click_callback
    public :: quit_callback
contains
    ! static void XtCallbackProc(Widget widget, XtPointer client_data, XtPointer call_data)
    subroutine click_callback(widget, client_data, call_data) bind(c)
        !! Xt callback routine for `XM_N_ACTIVATE_CALLBACK` that will be
        !! executed each the user clicks the button.
        type(c_ptr), intent(in), value :: widget
        type(c_ptr), intent(in), value :: client_data
        type(c_ptr), intent(in), value :: call_data
        type(c_ptr)                    :: dialog_ptr
        type(c_ptr)                    :: string_ptr, title_ptr
        type(xt_arg), target           :: args(2)

        if (.not. c_associated(call_data)) return

        title_ptr  = xm_string_create_localized('Hi, there!' // c_null_char)
        string_ptr = xm_string_create_localized('You clicked me!' // c_null_char)

        call xt_set_arg(args(1), XM_N_DIALOG_TITLE,   title_ptr)
        call xt_set_arg(args(2), XM_N_MESSAGE_STRING, string_ptr)
        dialog_ptr = xm_create_message_dialog(client_data, &
                                              'Message' // c_null_char, &
                                              c_loc(args), &
                                              size(args))
        call xm_string_free(string_ptr)
        call xm_string_free(title_ptr)
        call xt_manage_child(dialog_ptr)
    end subroutine click_callback

    ! static void XtCallbackProc(Widget widget, XtPointer client_data, XtPointer call_data)
    subroutine quit_callback(widget, client_data, call_data) bind(c)
        !! Xt callback routine that quits the application.
        type(c_ptr), intent(in), value :: widget
        type(c_ptr), intent(in), value :: client_data
        type(c_ptr), intent(in), value :: call_data

        stop
    end subroutine quit_callback
end module callback

program main
    use, intrinsic :: iso_c_binding
    use :: callback
    use :: xm
    use :: xt
    implicit none
    integer, parameter :: WINDOW_MIN_HEIGHT = 200
    integer, parameter :: WINDOW_MIN_WIDTH  = 320
    integer, parameter :: WINDOW_HEIGHT     = 300
    integer, parameter :: WINDOW_WIDTH      = 400

    character(len=16), target :: window_title = 'Fortran + Motif' // c_null_char
    type(c_ptr)               :: app_ptr
    type(c_ptr)               :: button_ptr
    type(c_ptr)               :: form_ptr
    type(c_ptr)               :: locale_ptr
    type(c_ptr)               :: window_ptr
    type(xt_arg),      target :: args(6)

    ! Set locale.
    locale_ptr = xt_set_language_proc(c_null_ptr, c_null_ptr, c_null_ptr)

    ! Create Xt window.
    call xt_set_arg(args(1), XM_N_TITLE,           c_loc(window_title))
    call xt_set_arg(args(2), XM_N_DELETE_RESPONSE, XM_DO_NOTHING)
    call xt_set_arg(args(3), XM_N_HEIGHT,          WINDOW_HEIGHT)
    call xt_set_arg(args(4), XM_N_WIDTH,           WINDOW_WIDTH)
    call xt_set_arg(args(5), XM_N_MIN_HEIGHT,      WINDOW_MIN_HEIGHT)
    call xt_set_arg(args(6), XM_N_MIN_WIDTH,       WINDOW_MIN_WIDTH)

    window_ptr = xt_open_application(app_ptr, &                         ! Application context.
                                     'FortranApp' // c_null_char, &     ! Class name of this application.
                                     c_null_ptr, &                      ! Options description.
                                     0, &                               ! Number of entries in the options list.
                                     0, &                               ! Number of command line parameters.
                                     c_null_ptr, &                      ! Command line parameters.
                                     c_null_ptr, &                      ! Fallback resources.
                                     APPLICATION_SHELL_WIDGET_CLASS, &  ! Widget class.
                                     c_loc(args), &                     ! Argument list.
                                     6)                                 ! Number of arguments in argument list.

    ! Create XmForm widget.
    call xt_set_arg(args(1), XM_N_MARGIN_HEIGHT, 25)
    call xt_set_arg(args(2), XM_N_MARGIN_WIDTH,  25)

    form_ptr = xt_create_managed_widget('Form' // c_null_char, &        ! Class name.
                                        XM_FORM_WIDGET_CLASS, &         ! Widget class.
                                        window_ptr, &                   ! Parent.
                                        c_loc(args), &                  ! Argument list.
                                        2)                              ! Number of entries in argument list.

    ! Create XmPushButton widget.
    button_ptr = create_push_button(form_ptr, 'Click me!', c_funloc(click_callback), window_ptr)
    call xt_set_arg(args(1), XM_N_LEFT_ATTACHMENT, XM_ATTACH_FORM)
    call xt_set_arg(args(2), XM_N_TOP_ATTACHMENT,  XM_ATTACH_FORM)
    call xt_set_arg(args(3), XM_N_MARGIN_HEIGHT,   5)
    call xt_set_arg(args(4), XM_N_MARGIN_WIDTH,    5)
    call xt_set_values(button_ptr, c_loc(args), 4)

    ! Set focus to XmPushButton widget.
    call xt_set_arg(args(1), XM_N_INITIAL_FOCUS, button_ptr)
    call xt_set_values(form_ptr, c_loc(args), 1)

    ! Show window.
    call xt_realize_widget(window_ptr)
    call add_window_delete_callback(window_ptr, c_funloc(quit_callback), c_null_ptr)

    call xt_app_main_loop(app_ptr)
contains
    function create_push_button(parent, name, callback, client_data) result(widget)
        !! Helper function that returns a new PushButton widget.
        type(c_ptr),      intent(in) :: parent
        character(len=*), intent(in) :: name
        type(c_funptr),   intent(in) :: callback
        type(c_ptr)                  :: client_data
        type(c_ptr)                  :: widget
        type(c_ptr)                  :: label_ptr
        type(xt_arg), target         :: args(2)

        label_ptr = xm_string_create_localized(name // c_null_char)
        call xt_set_arg(args(1), XM_N_LABEL_STRING, label_ptr)
        widget = xt_create_managed_widget(name // c_null_char, &            ! Class name.
                                          XM_PUSH_BUTTON_WIDGET_CLASS, &    ! Widget class.
                                          parent, &                         ! Parent.
                                          c_loc(args), &                    ! Argument list.
                                          1)                                ! Number of entries in argument list.
        call xm_string_free(label_ptr)
        call xt_add_callback(widget, &
                             XM_N_ACTIVATE_CALLBACK, &
                             callback, &
                             client_data)
    end function create_push_button

    subroutine add_window_delete_callback(widget, callback, client_data) bind(c)
        !! Adds Xt callback routine that will be invoked when the user closes
        !! the window.
        type(c_ptr),    intent(in) :: widget
        type(c_funptr), intent(in) :: callback
        type(c_ptr),    intent(in) :: client_data
        type(c_ptr)                :: display
        integer(kind=8)            :: wm_delete_window
        integer(kind=8)            :: wm_protocol_atom

        display = xt_display(widget)
        wm_protocol_atom = xm_intern_atom(display, 'WM_PROTOCOLS' // c_null_char, .false._c_bool)
        wm_delete_window = xm_intern_atom(display, 'WM_DELETE_WINDOW' // c_null_char, .true._c_bool)
        call xm_add_protocol_callback(widget, wm_protocol_atom, wm_delete_window, callback, client_data)
    end subroutine add_window_delete_callback
end program main
