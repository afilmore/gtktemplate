NULL=

AM_CPPFLAGS = \
	-include config.h \
	$(NULL)

bin_PROGRAMS = gtktemplate

gtktemplate_SOURCES = \
	Application.vala \
	MainWindow.vala \
	$(NULL)

gtktemplate_VALAFLAGS = \
	--vapidir=$(top_srcdir)/vapi \
	--pkg vconfig \
	--pkg gtk+-2.0 \
	$(NULL)

gtktemplate_CFLAGS = \
	$(GTK_CFLAGS) \
	-Wall \
	-Werror-implicit-function-declaration \
	$(NULL)

gtktemplate_LDADD = \
	$(GTK_LIBS) \
	$(NULL)

CLEANFILES = $(patsubst %.vala,%.c,$(filter %.vala, $(SOURCES))) gtktemplate_vala.stamp


