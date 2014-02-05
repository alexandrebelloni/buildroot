################################################################################
#
# tzdump
#
################################################################################

TZDUMP_VERSION = 65a10105564801094b18c3fcacf4dde4c44e4ab8
TZDUMP_SITE = $(call github,alexandrebelloni,tzdump,$(TZDUMP_VERSION))
TZDUMP_DEPENDENCIES = host-zic

define HOST_TZDUMP_BUILD_CMDS
	(cd $(@D) ;\
		$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) -o tzdump tzdump.c ; \
	)
endef

define HOST_TZDUMP_INSTALL_CMDS
	mkdir -p $(HOST_DIR)/usr/sbin
	install -D -m 755 $(@D)/tzdump $(HOST_DIR)/usr/sbin/tzdump
endef

$(eval $(host-generic-package))

TZDUMP = $(HOST_DIR)/usr/sbin/tzdump
