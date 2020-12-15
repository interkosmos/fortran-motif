! xm.f90
!
! Fortran 2008 ISO C binding interfaces to Xm.
!
! Author:  Philipp Engel
! Licence: ISC
module xm
    use, intrinsic :: iso_c_binding
    implicit none
    private

    integer(kind=c_int), parameter, public :: XM_UNSPECIFIED_PIXMAP = 2

    type(c_ptr), bind(c, name='xmArrowButtonGadgetClass'),   public :: XM_ARROW_BUTTON_GADGET_CLASS
    type(c_ptr), bind(c, name='xmBulletinBoardWidgetClass'), public :: XM_BULLETIN_BOARD_WIDGET_CLASS
    type(c_ptr), bind(c, name='xmCascadeButtonWidgetClass'), public :: XM_CASCADE_BUTTON_WIDGET_CLASS
    type(c_ptr), bind(c, name='xmDialogShellWidgetClass'),   public :: XM_DIALOG_SHELL_WIDGET_CLASS
    type(c_ptr), bind(c, name='xmFormWidgetClass'),          public :: XM_FORM_WIDGET_CLASS
    type(c_ptr), bind(c, name='xmFrameWidgetClass'),         public :: XM_FRAME_WIDGET_CLASS
    type(c_ptr), bind(c, name='xmLabelGadgetClass'),         public :: XM_LABEL_GADGET_CLASS
    type(c_ptr), bind(c, name='xmLabelWidgetClass'),         public :: XM_LABEL_WIDGET_CLASS
    type(c_ptr), bind(c, name='xmMainWindowWidgetClass'),    public :: XM_MAIN_WINDOW_WIDGET_CLASS
    type(c_ptr), bind(c, name='xmMessageBoxWidgetClass'),    public :: XM_MESSAGE_BOX_WIDGET_CLASS
    type(c_ptr), bind(c, name='xmPushButtonWidgetClass'),    public :: XM_PUSH_BUTTON_WIDGET_CLASS
    type(c_ptr), bind(c, name='xmRowColumnWidgetClass'),     public :: XM_ROW_COLUMN_WIDGET_CLASS
    type(c_ptr), bind(c, name='xmTextFieldWidgetClass'),     public :: XM_TEXT_FIELD_WIDGET_CLASS

    public :: XM_ALIGNMENT_BEGINNING, XM_ALIGNMENT_CENTER, XM_ALIGNMENT_END, XM_ALIGNMENT_UNSPECIFIED

    enum, bind(c)
        enumerator :: XM_ALIGNMENT_BEGINNING
        enumerator :: XM_ALIGNMENT_CENTER
        enumerator :: XM_ALIGNMENT_END
        enumerator :: XM_ALIGNMENT_UNSPECIFIED
    end enum

    public :: XM_ALIGNMENT_BASELINE_TOP, XM_ALIGNMENT_BASELINE_BOTTOM, XM_ALIGNMENT_WIDGET_TOP, &
              XM_ALIGNMENT_WIDGET_BOTTOM

    enum, bind(c)
        enumerator :: XM_ALIGNMENT_BASELINE_TOP
        enumerator :: XM_ALIGNMENT_BASELINE_BOTTOM = 2
        enumerator :: XM_ALIGNMENT_WIDGET_TOP
        enumerator :: XM_ALIGNMENT_WIDGET_BOTTOM
    end enum

    public :: XM_ARROW_UP, XM_ARROW_DOWN, XM_ARROW_LEFT, XM_ARROW_RIGHT

    enum, bind(c)
        enumerator :: XM_ARROW_UP
        enumerator :: XM_ARROW_DOWN
        enumerator :: XM_ARROW_LEFT
        enumerator :: XM_ARROW_RIGHT
    end enum

    public :: XM_ATTACH_NONE, XM_ATTACH_FORM, XM_ATTACH_OPPOSITE_FORM, XM_ATTACH_WIDGET, XM_ATTACH_OPPOSITE_WIDGET, &
              XM_ATTACH_POSITION, XM_ATTACH_SELF

    enum, bind(c)
        enumerator :: XM_ATTACH_NONE
        enumerator :: XM_ATTACH_FORM
        enumerator :: XM_ATTACH_OPPOSITE_FORM
        enumerator :: XM_ATTACH_WIDGET
        enumerator :: XM_ATTACH_OPPOSITE_WIDGET
        enumerator :: XM_ATTACH_POSITION
        enumerator :: XM_ATTACH_SELF
    end enum

    public :: XM_DESTROY, XM_UNMAP, XM_DO_NOTHING

    enum, bind(c)
        enumerator :: XM_DESTROY
        enumerator :: XM_UNMAP
        enumerator :: XM_DO_NOTHING
    end enum

    public :: XM_NO_PACKING, XM_PACK_TIGHT, XM_PACK_COLUMN, XM_PACK_NONE

    enum, bind(c)
        enumerator :: XM_NO_PACKING
        enumerator :: XM_PACK_TIGHT
        enumerator :: XM_PACK_COLUMN
        enumerator :: XM_PACK_NONE
    end enum

    public :: XM_PIXMAP, XM_PIXMAP_AND_STRING

    enum, bind(c)
        enumerator :: XM_PIXMAP = 1
        enumerator :: XM_PIXMAP_AND_STRING
    end enum

    public :: XM_RESIZE_NONE, XM_RESIZE_GROW, XM_RESIZE_ANY

    enum, bind(c)
        enumerator :: XM_RESIZE_NONE
        enumerator :: XM_RESIZE_GROW
        enumerator :: XM_RESIZE_ANY
    end enum

    public :: XM_SHADOW_IN, XM_SHADOW_OUT

    enum, bind(c)
        enumerator :: XM_SHADOW_IN = 7
        enumerator :: XM_SHADOW_OUT
    end enum

    public :: XM_NO_LINE, XM_SINGLE_LINE, XM_DOUBLE_LINE, XM_SINGLE_DASHED_LINE, XM_DOUBLE_DASHED_LINE, XM_SHADOW_ETCHED_IN, &
              XM_SHADOW_ETCHED_OUT, XM_SHADOW_ETCHED_IN_DASH, XM_SHADOW_ETCHED_OUT_DASH, XM_INVALID_SEPARATOR_TYPE

    enum, bind(c)
        enumerator :: XM_NO_LINE
        enumerator :: XM_SINGLE_LINE
        enumerator :: XM_DOUBLE_LINE
        enumerator :: XM_SINGLE_DASHED_LINE
        enumerator :: XM_DOUBLE_DASHED_LINE
        enumerator :: XM_SHADOW_ETCHED_IN
        enumerator :: XM_SHADOW_ETCHED_OUT
        enumerator :: XM_SHADOW_ETCHED_IN_DASH
        enumerator :: XM_SHADOW_ETCHED_OUT_DASH
        enumerator :: XM_INVALID_SEPARATOR_TYPE
    end enum

    character(kind=c_char, len=*), parameter, public :: XM_N_ACTIVATE_CALLBACK        = 'activateCallback' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_ALIGNMENT                = 'alignment' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_ALLOW_SHELL_RESIZE       = 'allowShellResize' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_ARROW_DIRECTION          = 'arrowDirection' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_BACKGROUND               = 'background' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_BOTTOM_ATTACHMENT        = 'bottomAttachment' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_BOTTOM_POSITION          = 'bottomPosition' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_BOTTOM_WIDGET            = 'bottomWidget' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_CHILD_VERTICAL_ALIGNMENT = 'childVerticalAlignment' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_DIALOG_TITLE             = 'dialogTitle' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_DELETE_RESPONSE          = 'deleteResponse' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_FOCUS_CALLBACK           = 'focusCallback' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_FONT_FAMILY              = 'fontFamily' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_FONT_SIZE_FIXED_LIST     = 'fontSizeFixedList' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_FONT_SIZE_LIST           = 'fontSizeList' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_FOREGROUND               = 'foreground' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_FRACTION_BASE            = 'fractionBase' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_HEIGHT                   = 'height' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_INITIAL_FOCUS            = 'initialFocus' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_LABEL_PIXMAP             = 'labelPixmap' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_LABEL_STRING             = 'labelString' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_LABEL_TYPE               = 'labelType' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_LEFT_ATTACHMENT          = 'leftAttachment' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_LEFT_POSITION            = 'leftPosition' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_LEFT_WIDGET              = 'leftWidget' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_MARGIN_BOTTOM            = 'marginBottom' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_MARGIN_HEIGHT            = 'marginHeight' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_MARGIN_LEFT              = 'marginLeft' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_MARGIN_RIGHT             = 'marginRight' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_MARGIN_TOP               = 'marginTop' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_MARGIN_WIDTH             = 'marginWidth' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_MAX_HEIGHT               = 'maxHeight' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_MAX_WIDTH                = 'maxWidth' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_MESSAGE_STRING           = 'messageString' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_MIN_HEIGHT               = 'minHeight' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_MIN_WIDTH                = 'minWidth' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_MNEMONIC                 = 'mnemonic' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_NUM_COLUMNS              = 'numColumns' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_PACKING                  = 'packing' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_RIGHT_ATTACHMENT         = 'rightAttachment' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_RIGHT_POSITION           = 'rightPosition' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_RIGHT_WIDGET             = 'rightWidget' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_SHADOW_TYPE              = 'shadowType' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_SUB_MENU_ID              = 'subMenuId' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_TITLE                    = 'title' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_TITLE_ENCODING           = 'titleEncoding' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_TOP_ATTACHMENT           = 'topAttachment' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_TOP_POSITION             = 'topPosition' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_TOP_WIDGET               = 'topWidget' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_VALUE                    = 'value' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_WIDTH                    = 'width' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_X                         = 'x' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_Y                         = 'y' // c_null_char

    public :: xm_add_protocol_callback
    public :: xm_create_dialog_shell
    public :: xm_create_menu_bar
    public :: xm_create_message_dialog
    public :: xm_create_pulldown_menu
    public :: xm_get_pixmap
    public :: xm_intern_atom
    public :: xm_string_create_localized
    public :: xm_string_free
    public :: xm_text_field_get_string
    public :: xm_text_field_set_string

    interface
        ! Widget XmCreateDialogShell(Widget parent, String name, ArgList arglist, Cardinal argcount)
        function xm_create_dialog_shell(parent, name, arglist, argcount) bind(c, name='XmCreateDialogShell')
            import :: c_char, c_int, c_ptr
            type(c_ptr),            intent(in), value :: parent
            character(kind=c_char), intent(in)        :: name
            type(c_ptr),            intent(in), value :: arglist
            integer(kind=c_int),    intent(in), value :: argcount
            type(c_ptr)                               :: xm_create_dialog_shell
        end function xm_create_dialog_shell

        ! Widget XmCreateMenuBar(Widget parent, String name, ArgList arglist, Cardinal argcount)
        function xm_create_menu_bar(parent, name, arglist, argcount) bind(c, name='XmCreateMenuBar')
            import :: c_char, c_int, c_ptr
            type(c_ptr),            intent(in), value :: parent
            character(kind=c_char), intent(in)        :: name
            type(c_ptr),            intent(in), value :: arglist
            integer(kind=c_int),    intent(in), value :: argcount
            type(c_ptr)                               :: xm_create_menu_bar
        end function xm_create_menu_bar

        ! Widget XmCreateMessageDialog(Widget parent, String name, ArgList arglist, Cardinal argcount)
        function xm_create_message_dialog(parent, name, arglist, argcount) bind(c, name='XmCreateMessageDialog')
            import :: c_char, c_int, c_ptr
            type(c_ptr),            intent(in), value :: parent
            character(kind=c_char), intent(in)        :: name
            type(c_ptr),            intent(in), value :: arglist
            integer(kind=c_int),    intent(in), value :: argcount
            type(c_ptr)                               :: xm_create_message_dialog
        end function xm_create_message_dialog

        ! Widget XmCreatePulldownMenu(Widget parent, String name, ArgList arglist, Cardinal argcount)
        function xm_create_pulldown_menu(parent, name, arglist, argcount) bind(c, name='XmCreatePulldownMenu')
            import :: c_char, c_int, c_ptr
            type(c_ptr),            intent(in), value :: parent
            character(kind=c_char), intent(in)        :: name
            type(c_ptr),            intent(in), value :: arglist
            integer(kind=c_int),    intent(in), value :: argcount
            type(c_ptr)                               :: xm_create_pulldown_menu
        end function xm_create_pulldown_menu

        ! Pixmap XmGetPixmap(Screen *screen, char *image_name, Pixel foreground, Pixel background)
        function xm_get_pixmap(screen, image_name, foreground, background) bind(c, name='XmGetPixmap')
            import :: c_char, c_long, c_ptr
            type(c_ptr),            intent(in), value :: screen
            character(kind=c_char), intent(in)        :: image_name
            integer(kind=c_long),   intent(in), value :: foreground
            integer(kind=c_long),   intent(in), value :: background
            integer(kind=c_long)                      :: xm_get_pixmap
        end function xm_get_pixmap

        ! XmString XmStringCreateLocalized(char *text)
        function xm_string_create_localized(text) bind(c, name='XmStringCreateLocalized')
            import :: c_char, c_ptr
            character(kind=c_char), intent(in) :: text
            type(c_ptr)                        :: xm_string_create_localized
        end function xm_string_create_localized

        ! Atom XmInternAtom(Display *display, String name, Boolean only_if_exists)
        function xm_intern_atom(display, name, only_if_exists) bind(c, name='XmInternAtom')
            import :: c_bool, c_char, c_long, c_ptr
            type(c_ptr),            intent(in), value :: display
            character(kind=c_char), intent(in)        :: name
            logical(kind=c_bool),   intent(in), value :: only_if_exists
            integer(kind=c_long)                      :: xm_intern_atom
        end function xm_intern_atom

        ! char *XmTextFieldGetString(Widget widget)
        function xm_text_field_get_string_(widget) bind(c, name='XmTextFieldGetString')
            import :: c_ptr
            type(c_ptr), intent(in), value :: widget
            type(c_ptr)                    :: xm_text_field_get_string_
        end function xm_text_field_get_string_

        ! void XmAddProtocolCallback(Widget shell, Atom property, Atom proto_atom, XtCallbackProc callback, XtPointer closure)
        subroutine xm_add_protocol_callback(shell, property, proto_atom, callback, closure) bind(c, name='XmAddProtocolCallback')
            import :: c_funptr, c_long, c_ptr
            type(c_ptr),          intent(in), value :: shell
            integer(kind=c_long), intent(in), value :: property
            integer(kind=c_long), intent(in), value :: proto_atom
            type(c_funptr),       intent(in), value :: callback
            type(c_ptr),          intent(in), value :: closure
        end subroutine xm_add_protocol_callback

        ! void XmStringFree(XmString string)
        subroutine xm_string_free(string) bind(c, name='XmStringFree')
            import :: c_ptr
            type(c_ptr), intent(in), value :: string
        end subroutine xm_string_free

        ! void XmTextFieldSetString(Widget widget, char *value)
        subroutine xm_text_field_set_string(widget, value) bind(c, name='XmTextFieldSetString')
            import :: c_char, c_ptr
            type(c_ptr),            intent(in), value :: widget
            character(kind=c_char), intent(in)        :: value
        end subroutine xm_text_field_set_string
    end interface

    interface
        ! size_t strlen(char *str)
        function c_strlen(str) bind(c, name='strlen')
            import :: c_ptr, c_size_t
            type(c_ptr), intent(in), value :: str
            integer(c_size_t)              :: c_strlen
        end function c_strlen
    end interface
contains
    function xm_text_field_get_string(widget)
        type(c_ptr), intent(in)       :: widget
        character(len=:), allocatable :: xm_text_field_get_string
        type(c_ptr)                   :: ptr

        ptr = xm_text_field_get_string_(widget)

        if (.not. c_associated(ptr)) return
        allocate (character(len=c_strlen(ptr)) :: xm_text_field_get_string)
        call c_f_string_ptr(ptr, xm_text_field_get_string)
    end function xm_text_field_get_string

    subroutine c_f_string_ptr(c_string, f_string)
        !! Utility routine that copies a C string, passed as a C pointer, to a
        !! Fortran string.
        type(c_ptr),      intent(in)           :: c_string
        character(len=*), intent(out)          :: f_string
        character(kind=c_char, len=1), pointer :: char_ptrs(:)
        integer                                :: i

        if (.not. c_associated(c_string)) then
            f_string = ' '
            return
        end if

        call c_f_pointer(c_string, char_ptrs, [ huge(0) ])

        i = 1

        do while (char_ptrs(i) /= c_null_char .and. i <= len(f_string))
            f_string(i:i) = char_ptrs(i)
            i = i + 1
        end do

        if (i < len(f_string)) f_string(i:) = ' '
    end subroutine c_f_string_ptr
end module xm
