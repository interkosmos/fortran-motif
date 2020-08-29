! xt.f90
!
! Fortran 2008 ISO C binding interfaces to selected Xt constants and functions.
!
! Author:  Philipp Engel
! Licence: ISC
module xt
    use, intrinsic :: iso_c_binding
    implicit none
    private
    public :: xt_add_callback
    public :: xt_add_event_handler
    public :: xt_app_main_loop
    public :: xt_app_pending
    public :: xt_create_managed_widget
    public :: xt_display
    public :: xt_get_values
    public :: xt_manage_child
    public :: xt_open_application
    public :: xt_parent
    public :: xt_popdown
    public :: xt_popup
    public :: xt_realize_widget
    public :: xt_resize_widget
    public :: xt_screen
    public :: xt_set_arg
    public :: xt_set_language_proc
    public :: xt_set_values
    public :: xt_window

    type, bind(c), public :: xt_arg
        type(c_ptr)          :: name
        integer(kind=c_long) :: value
    end type xt_arg

    public :: XT_GRAB_NONE, XT_GRAB_NONEXCLUSIVE, XT_GRAB_EXCLUSIVE

    enum, bind(c)
        enumerator :: XT_GRAB_NONE
        enumerator :: XT_GRAB_NONEXCLUSIVE
        enumerator :: XT_GRAB_EXCLUSIVE
    end enum

    type(c_ptr), bind(c, name='applicationShellWidgetClass'), public :: APPLICATION_SHELL_WIDGET_CLASS
    type(c_ptr), bind(c, name='sessionShellWidgetClass'),     public :: SESSION_SHELL_WIDGET_CLASS
    type(c_ptr), bind(c, name='transientShellWidgetClass'),   public :: TRANSIENT_SHELL_WIDGET_CLASS

    integer(kind=c_long), parameter, public :: NO_EVENT_MASK              = 0
    integer(kind=c_long), parameter, public :: KEY_PRESS_MASK             = ishft(1, 0)
    integer(kind=c_long), parameter, public :: KEY_RELEASE_MASK           = ishft(1, 1)
    integer(kind=c_long), parameter, public :: BUTTON_PRESS_MASK          = ishft(1, 2)
    integer(kind=c_long), parameter, public :: BUTTON_RELEASE_MASK        = ishft(1, 3)
    integer(kind=c_long), parameter, public :: ENTER_WINDOW_MASK          = ishft(1, 4)
    integer(kind=c_long), parameter, public :: LEAVE_WINDOW_MASK          = ishft(1, 5)
    integer(kind=c_long), parameter, public :: POINTER_MOTION_MASK        = ishft(1, 6)
    integer(kind=c_long), parameter, public :: POINTER_MOTION_HINT_MASK   = ishft(1, 7)
    integer(kind=c_long), parameter, public :: BUTTON1_MOTION_MASK        = ishft(1, 8)
    integer(kind=c_long), parameter, public :: BUTTON2_MOTION_MASK        = ishft(1, 9)
    integer(kind=c_long), parameter, public :: BUTTON3_MOTION_MASK        = ishft(1, 10)
    integer(kind=c_long), parameter, public :: BUTTON4_MOTION_MASK        = ishft(1, 11)
    integer(kind=c_long), parameter, public :: BUTTON5_MOTION_MASK        = ishft(1, 12)
    integer(kind=c_long), parameter, public :: BUTTON_MOTION_MASK         = ishft(1, 13)
    integer(kind=c_long), parameter, public :: KEYMAP_STATE_MASK          = ishft(1, 14)
    integer(kind=c_long), parameter, public :: EXPOSURE_MASK              = ishft(1, 15)
    integer(kind=c_long), parameter, public :: VISIBILITY_CHANGE_MASK     = ishft(1, 16)
    integer(kind=c_long), parameter, public :: STRUCTURE_NOTIFY_MASK      = ishft(1, 17)
    integer(kind=c_long), parameter, public :: RESIZE_REDIRECT_MASK       = ishft(1, 18)
    integer(kind=c_long), parameter, public :: SUBSTRUCTURE_NOTIFY_MASK   = ishft(1, 19)
    integer(kind=c_long), parameter, public :: SUBSTRUCTURE_REDIRECT_MASK = ishft(1, 20)
    integer(kind=c_long), parameter, public :: FOCUS_CHANGE_MASK          = ishft(1, 21)
    integer(kind=c_long), parameter, public :: PROPERTY_CHANGE_MASK       = ishft(1, 22)
    integer(kind=c_long), parameter, public :: COLORMAP_CHANGE_MASK       = ishft(1, 23)
    integer(kind=c_long), parameter, public :: OWNER_GRAB_BUTTON_MASK     = ishft(1, 24)

    ! Function overloading of `xt_set_arg()`.
    interface xt_set_arg
        ! The C routine XtSetArg() is implemented as a macro and can therefore
        ! not be binded directly. Since the routine is just filling a struct
        ! with given arguments, we can achieve the same functionality in
        ! Fortran without any FFIs. Make sure that the string argument `name`
        ! has proper null termination. The value is either stored as a long
        ! integer or a pointer.
        module procedure :: xt_set_arg_int
        module procedure :: xt_set_arg_long
        module procedure :: xt_set_arg_ptr
    end interface xt_set_arg

    interface
        ! XtInputMask XtAppPending(XtAppContext app_context)
        function xt_app_pending(app_context) bind(c, name='XtAppPending')
            import :: c_long, c_ptr
            type(c_ptr), intent(in) :: app_context
            integer(kind=c_long)    :: xt_app_pending
        end function xt_app_pending

        ! Widget XtCreateManagedWidget(String name, WidgetClass widget_class, Widget parent, ArgList args, Cardinal num_args)
        function xt_create_managed_widget(name, widget_class, parent, args, num_args) bind(c, name='XtCreateManagedWidget')
            import :: c_char, c_int, c_ptr
            character(kind=c_char, len=1), intent(in)        :: name
            type(c_ptr),                   intent(in), value :: widget_class
            type(c_ptr),                   intent(in), value :: parent
            type(c_ptr),                   intent(in), value :: args
            integer(kind=c_int),           intent(in), value :: num_args
            type(c_ptr)                                      :: xt_create_managed_widget
        end function xt_create_managed_widget

        ! Display *XtDisplay(Widget w)
        function xt_display(w) bind(c, name='XtDisplay')
            import :: c_ptr
            type(c_ptr), intent(in), value :: w
            type(c_ptr)                    :: xt_display
        end function xt_display

        ! Widget XtOpenApplication(XtAppContext app_context_return, String application_class, XrmOptionDescRec *options,
        !                          Cardinal num_options, int *argc_in_out, String *argv_in_out, String *fallback_resources,
        !                          WidgetClass widget_class, ArgList args, Cardinal num_args)
        function xt_open_application(app_context_return, application_class, options, num_options, &
                                     argc_in_out, argv_in_out, fallback_resources, widget_class, &
                                     args, num_args) bind(c, name='XtOpenApplication')
            import :: c_char, c_int, c_ptr
            type(c_ptr),                   intent(in)        :: app_context_return
            character(kind=c_char, len=1), intent(in)        :: application_class
            type(c_ptr),                   intent(in), value :: options
            integer(kind=c_int),           intent(in), value :: num_options
            integer(kind=c_int),           intent(in)        :: argc_in_out
            type(c_ptr),                   intent(in), value :: argv_in_out
            type(c_ptr),                   intent(in), value :: fallback_resources
            type(c_ptr),                   intent(in), value :: widget_class
            type(c_ptr),                   intent(in), value :: args
            integer(kind=c_int),           intent(in), value :: num_args
            type(c_ptr)                                      :: xt_open_application
        end function xt_open_application

        ! Widget XtParent(Widget w)
        function xt_parent(w) bind(c, name='XtParent')
            import :: c_ptr
            type(c_ptr), intent(in), value :: w
            type(c_ptr)                    :: xt_parent
        end function xt_parent

        ! Screen *XtScreen(Widget w)
        function xt_screen(w) bind(c, name='XtScreen')
            import :: c_ptr
            type(c_ptr), intent(in), value :: w
            type(c_ptr)                    :: xt_screen
        end function xt_screen

        ! Widget XtSetLanguageProc(XtAppContext app_context, XtLanguageProc proc, XtPointer client_data)
        function xt_set_language_proc(app_context, proc, client_data) bind(c, name='XtSetLanguageProc')
            import :: c_ptr
            type(c_ptr), intent(in), value :: app_context
            type(c_ptr), intent(in), value :: proc
            type(c_ptr), intent(in), value :: client_data
            type(c_ptr)                    :: xt_set_language_proc
        end function xt_set_language_proc

        ! Window XtWindow(Widget w)
        function xt_window(w) bind(c, name='XtWindow')
            import :: c_ptr
            type(c_ptr), intent(in), value :: w
            type(c_ptr)                    :: xt_window
        end function xt_window

        ! void XtAddCallback(Widget w, String callback_name, XtCallbackProc callback, XtPointer client_data)
        subroutine xt_add_callback(w, callback_name, callback, client_data) bind(c, name='XtAddCallback')
            import :: c_char, c_funptr, c_ptr
            type(c_ptr),                   intent(in), value :: w
            character(kind=c_char, len=1), intent(in)        :: callback_name
            type(c_funptr),                intent(in), value :: callback
            type(c_ptr),                   intent(in), value :: client_data
        end subroutine xt_add_callback

        ! void XtAddEventHandler(Widget w, EventMask event_mask, Boolean nonmaskable, XtEventHandler proc, XtPointer client_data)
        subroutine xt_add_event_handler(w, event_mask, nonmaskable, proc, client_data) bind(c, name='XtAddEventHandler')
            import :: c_bool, c_funptr, c_long, c_ptr
            type(c_ptr),                   intent(in), value :: w
            integer(kind=c_long),          intent(in), value :: event_mask
            logical(kind=c_bool),          intent(in), value :: nonmaskable
            type(c_funptr),                intent(in), value :: proc
            type(c_ptr),                   intent(in), value :: client_data
        end subroutine xt_add_event_handler

        ! void XtAppMainLoop(XtAppContext app_context)
        subroutine xt_app_main_loop(app_context) bind(c, name='XtAppMainLoop')
            import :: c_ptr
            type(c_ptr), intent(in), value :: app_context
        end subroutine xt_app_main_loop

        ! void XtGetValues(Widget w, ArgList args, Cardinal num_args);
        subroutine xt_get_values(w, args, num_args) bind(c, name='XtGetValues')
            import :: c_int, c_ptr
            type(c_ptr),         intent(in), value :: w
            type(c_ptr),         intent(in), value :: args
            integer(kind=c_int), intent(in), value :: num_args
        end subroutine xt_get_values

        ! void XtManageChild(Widget child)
        subroutine xt_manage_child(child) bind(c, name='XtManageChild')
            import :: c_ptr
            type(c_ptr), intent(in), value :: child
        end subroutine xt_manage_child

        ! void XtPopdown(Widget popup_shell)
        subroutine xt_popdown(popup_shell) bind(c, name='XtPopdown')
            import :: c_ptr
            type(c_ptr), intent(in), value :: popup_shell
        end subroutine xt_popdown

        ! void XtPopup(Widget popup_shell, XtGrabKind grab_kind)
        subroutine xt_popup(popup_shell, grab_kind) bind(c, name='XtPopup')
            import :: c_int, c_ptr
            type(c_ptr),         intent(in), value :: popup_shell
            integer(kind=c_int), intent(in), value :: grab_kind
        end subroutine xt_popup

        ! void XtRealizeWidget(Widget w)
        subroutine xt_realize_widget(w) bind(c, name='XtRealizeWidget')
            import :: c_ptr
            type(c_ptr), intent(in), value :: w
        end subroutine xt_realize_widget

        ! void XtResizeWidget(Widget w, Dimension width, Dimension height, Dimension border_width)
        subroutine xt_resize_widget(w, width, height, border_width) bind(c, name='XtResizeWidget')
            import :: c_ptr, c_short
            type(c_ptr),           intent(in), value :: w
            integer(kind=c_short), intent(in), value :: width
            integer(kind=c_short), intent(in), value :: height
            integer(kind=c_short), intent(in), value :: border_width
        end subroutine xt_resize_widget

        ! void XtSetValues(Widget w, ArgList args, Cardinal num_args);
        subroutine xt_set_values(w, args, num_args) bind(c, name='XtSetValues')
            import :: c_int, c_ptr
            type(c_ptr),         intent(in), value :: w
            type(c_ptr),         intent(in), value :: args
            integer(kind=c_int), intent(in), value :: num_args
        end subroutine xt_set_values
    end interface
contains
    subroutine xt_set_arg_int(arg, name, value)
        !! Stores the given integer in the argument list.
        type(xt_arg),                          intent(inout) :: arg     !! The argument list.
        character(kind=c_char, len=*), target, intent(in)    :: name    !! The key.
        integer(kind=c_int),                   intent(in)    :: value   !! The value.

        arg%name  = c_loc(name)
        arg%value = int(value, kind=c_long)
    end subroutine xt_set_arg_int

    subroutine xt_set_arg_long(arg, name, value)
        !! Stores the given long integer in the argument list.
        type(xt_arg),                          intent(inout) :: arg     !! The argument list.
        character(kind=c_char, len=*), target, intent(in)    :: name    !! The key.
        integer(kind=c_long),                  intent(in)    :: value   !! The value.

        arg%name  = c_loc(name)
        arg%value = value
    end subroutine xt_set_arg_long

    subroutine xt_set_arg_ptr(arg, name, value)
        !! Casts the given pointer to `c_long` and stores the memory address in
        !! the argument list.
        !!
        !! In general, `c_intptr_t` should be prefered over `c_long`. But this
        !! routine stays close to the C code, where the pointer value is
        !! declared as of type `c_long`.
        type(xt_arg),                          intent(inout) :: arg     !! The argument list.
        character(kind=c_char, len=*), target, intent(in)    :: name    !! The key.
        type(c_ptr),                           intent(in)    :: value   !! The value.
        integer(kind=c_long)                                 :: addr

        addr = transfer(value, addr)

        arg%name  = c_loc(name)
        arg%value = addr
    end subroutine xt_set_arg_ptr
end module xt
