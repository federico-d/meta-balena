FILESEXTRAPATHS_append := ":${THISDIR}/balena-files"
SYSTEMD_AUTO_ENABLE = "enable"

SRC_URI_append = " \
    file://mm-huawei-configuration-switch.sh \
    file://ModemManager.conf.systemd \
"

PACKAGECONFIG_remove = "polkit"

do_install_append() {
    install -d ${D}/lib/udev/rules.d/
    install -m 0755 ${WORKDIR}/mm-huawei-configuration-switch.sh ${D}/lib/udev/

    install -d ${D}${sysconfdir}/systemd/system/ModemManager.service.d
    install -m 0644 ${WORKDIR}/ModemManager.conf.systemd ${D}${sysconfdir}/systemd/system/ModemManager.service.d/ModemManager.conf
}

FILES_${PN} += " \
    /lib/udev/mm-huawei-configuration-switch.sh \
    "
