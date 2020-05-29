! click.f90
!
! Example Fortran application that shows an XBM image inside an XmLabel.
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding
    use :: xm
    use :: xt
    implicit none
    integer, parameter :: WINDOW_HEIGHT = 300
    integer, parameter :: WINDOW_WIDTH  = 400

    character(len=16),    target :: window_title = 'Fortran + Motif' // c_null_char
    integer(kind=c_long)         :: pixmap
    integer(kind=c_long), target :: bg, fg
    type(c_ptr)                  :: app_ptr
    type(c_ptr)                  :: form_ptr
    type(c_ptr)                  :: label_ptr
    type(c_ptr)                  :: window_ptr
    type(xt_arg),         target :: args(6)

    ! Create Xt window.
    call xt_set_arg(args(1), XM_N_TITLE,  c_loc(window_title))
    call xt_set_arg(args(2), XM_N_HEIGHT, WINDOW_HEIGHT)
    call xt_set_arg(args(3), XM_N_WIDTH,  WINDOW_WIDTH)

    window_ptr = xt_open_application(app_ptr, &                         ! Application context.
                                     'FortranApp' // c_null_char, &     ! Class name of this application.
                                     c_null_ptr, &                      ! Options description.
                                     0, &                               ! Number of entries in the options list.
                                     0, &                               ! Number of command line parameters.
                                     c_null_ptr, &                      ! Command line parameters.
                                     c_null_ptr, &                      ! Fallback resources.
                                     APPLICATION_SHELL_WIDGET_CLASS, &  ! Widget class.
                                     c_loc(args), &                     ! Argument list.
                                     3)                                 ! Number of arguments in argument list.

    ! Create XmForm widget.
    form_ptr = xt_create_managed_widget('Form' // c_null_char, &
                                         XM_FORM_WIDGET_CLASS, &
                                         window_ptr, &
                                         c_null_ptr, &
                                         0)

    ! Load Pixmap file.
    call xt_set_arg(args(1), XM_N_FOREGROUND, c_loc(fg))
    call xt_set_arg(args(2), XM_N_BACKGROUND, c_loc(bg))
    call xt_get_values(form_ptr, c_loc(args), 2)

    pixmap = xm_get_pixmap(xt_screen(form_ptr), 'sisyphus.xbm' // c_null_char, fg, bg)

    ! Create XmLabel widget.
    call xt_set_arg(args(1), XM_N_TOP_ATTACHMENT,  XM_ATTACH_FORM)
    call xt_set_arg(args(2), XM_N_LEFT_ATTACHMENT, XM_ATTACH_FORM)
    call xt_set_arg(args(3), XM_N_MARGIN_HEIGHT,   25)
    call xt_set_arg(args(4), XM_N_MARGIN_WIDTH,    25)
    call xt_set_arg(args(5), XM_N_LABEL_TYPE,      XM_PIXMAP)
    call xt_set_arg(args(6), XM_N_LABEL_PIXMAP,    pixmap)

    label_ptr = xt_create_managed_widget('Pixmap' // c_null_char, &
                                         XM_LABEL_GADGET_CLASS, &
                                         form_ptr, &
                                         c_loc(args), &
                                         6)

    ! Show window and run main loop.
    call xt_realize_widget(window_ptr)
    call xt_app_main_loop(app_ptr)
end program main
