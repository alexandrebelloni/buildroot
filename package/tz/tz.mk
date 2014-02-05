################################################################################
#
# tz
#
################################################################################

TZ_SOURCE =
TZ_DEPENDENCIES = host-tzdata host-tzdump
TZ_LICENSE = Public domain

define TZ_BUILD_CMDS
	$(TZDUMP) -p $(HOST)/usr/share/zoneinfo/posix/ -q $(BR2_SYSTEM_LOCALTIME) > $(@D)/TZ
endef

define TZ_INSTALL_TARGET_CMDS
	cp $(@D)/TZ  $(TARGET_DIR)/etc/TZ
endef

$(eval $(generic-package))
