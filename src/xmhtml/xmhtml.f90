! xmhtml.f90
!
! Fortran 2003 ISO C binding interfaces to the XmHTML widget for Motif.
!
! Author:  Philipp Engel
! Licence: ISC
module xmhtml
    use, intrinsic :: iso_c_binding
    implicit none
    private

    type(c_ptr), bind(c, name='xmHTMLWidgetClass'), public :: XM_HTML_WIDGET_CLASS

    character(kind=c_char, len=*), parameter, public :: XM_N_ANCHOR_BUTTONS           = 'anchorButtons' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_ANCHOR_UNDERLINE_TYPE    = 'anchorUnderlineType' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_ANCHOR_VISITED_PROC      = 'anchorVisitedProc' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_CLIENT_DATA              = 'clientData' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_ENABLE_BAD_HTML_WARNINGS = 'enableBadHTMLWarnings' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_ENABLE_ICON_ENTITIES     = 'enableIconEntities' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_ICON_ALIGNMENT           = 'iconAlignment' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_IMAGE_ENABLE             = 'imageEnable' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_RESIZE_HEIGHT            = 'resizeHeight' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_RESIZE_WIDTH             = 'resizeWidth' // c_null_char
    character(kind=c_char, len=*), parameter, public :: XM_N_SMOOTH_SCROLLING         = 'smoothScrolling' // c_null_char

    public :: XMHTML_NONE, XMHTML_UNKNOWN_ELEMENT, XMHTML_BAD, XMHTML_OPEN_BLOCK, XMHTML_CLOSE_BLOCK, &
              XMHTML_OPEN_ELEMENT, XMHTML_NESTED, XMHTML_VIOLATION, XMHTML_ALL

    enum, bind(c)
        enumerator :: XMHTML_NONE            = 0
        enumerator :: XMHTML_UNKNOWN_ELEMENT = 1
        enumerator :: XMHTML_BAD             = 2
        enumerator :: XMHTML_OPEN_BLOCK      = 4
        enumerator :: XMHTML_CLOSE_BLOCK     = 8
        enumerator :: XMHTML_OPEN_ELEMENT    = 16
        enumerator :: XMHTML_NESTED          = 32
        enumerator :: XMHTML_VIOLATION       = 64
        enumerator :: XMHTML_ALL             = 127
    end enum

    type, bind(c), public :: xm_html_anchor_callback_struct
        integer(kind=c_int)  :: reason          ! The reason the callback was called.
        type(c_ptr)          :: event           ! Event structure that triggered callback.
        integer(kind=c_int)  :: url_type        ! Type of URL referenced.
        integer(kind=c_int)  :: line            ! Line number of the selected anchor.
        type(c_ptr)          :: href            ! Pointer to the anchor value.
        type(c_ptr)          :: target          ! Pointer to target value.
        type(c_ptr)          :: rel             ! Pointer to rel value.
        type(c_ptr)          :: rev             ! Pointer to rev value.
        type(c_ptr)          :: title           ! Pointer to title value.
        logical(kind=c_bool) :: is_frame        ! True when inside a frame.
        logical(kind=c_bool) :: doit            ! Local anchor vetoing flag.
        logical(kind=c_bool) :: visited         ! Local anchor visited flag.
        logical(kind=c_bool) :: doc_modified    ! Set to True when document is modified.
    end type xm_html_anchor_callback_struct

    type, bind(c), public :: xm_image_info
        type(c_ptr)            :: url           ! Original location of image.
        type(c_ptr)            :: data          ! Raw image data. ZPixmap format.
        type(c_ptr)            :: clip          ! Raw clipmask data. XYBitmap format.
        integer(kind=c_short)  :: width         ! Used image width, in pixels.
        integer(kind=c_short)  :: height        ! Used image height, in pixels.
        type(c_ptr)            :: reds          ! Red image pixels.
        type(c_ptr)            :: greens        ! Green image pixels.
        type(c_ptr)            :: blues         ! Blue image pixels.
        integer(kind=c_int)    :: ncolors       ! Number of colors in the image.
        integer(kind=c_int)    :: bg            ! Transparent pixel index.
        type(c_ptr)            :: rgba          ! Image data in rgba format.
        real(kind=c_float)     :: fg_gamma      ! Image gamma.
        integer(kind=c_int)    :: options       ! Image option bits.
        integer(kind=c_int)    :: x             ! Logical screen x-position for a frame.
        integer(kind=c_int)    :: y             ! Logical screen y-position for a frame.
        integer(kind=c_int)    :: loop_count    ! Animation loop count.
        character(kind=c_char) :: dispose       ! Image disposal method.
        integer(kind=c_int)    :: timeout       ! Frame refreshment in milliseconds.
        integer(kind=c_int)    :: nframes       ! No. of animation frames remaining.
        type(c_ptr)            :: frame         ! Pointer to next animation frame.
        character(kind=c_char) :: type          ! Image type, see below.
        integer(kind=c_int)    :: depth         ! Bits per pixel for this image.
        character(kind=c_char) :: colorspace    ! Colorspace for this image.
        character(kind=c_char) :: transparency  ! Transparency type for this image.
        integer(kind=c_short)  :: swidth        ! Image width as read from image.
        integer(kind=c_short)  :: sheight       ! Image height as read from image.
        integer(kind=c_int)    :: scolors       ! Original number of colors in the image.
        type(c_ptr)            :: user_data     ! Any data to be stored with this image.
    end type xm_image_info

    public :: xm_html_text_set_string

    interface
        ! void XmHTMLTextSetString(Widget html_w, char *value)
        subroutine xm_html_text_set_string(html_w, value) bind(c, name='XmHTMLTextSetString')
            import :: c_char, c_ptr
            type(c_ptr),                   intent(in), value :: html_w
            character(kind=c_char, len=1), intent(in)        :: value
        end subroutine xm_html_text_set_string
    end interface
end module xmhtml
