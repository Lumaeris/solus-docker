FROM scratch as builder
ADD ./solus /

RUN eopkg ur; \
    eopkg add-repo Solus https://cdn.getsol.us/repo/shannon/eopkg-index.xml.xz -D /rootfs; \
    eopkg it --ignore-comar -D /rootfs --ignore-safety baselayout -y; \
    eopkg it --ignore-comar -D /rootfs --ignore-safety -c system.base -y; \
    c_rehash /rootfs/etc/ssl/certs; \
    ldconfig -C /rootfs/etc/ld.so.cache; \
    rm -r \
        /rootfs/var/lib/eopkg/index/Solus/* \
        /rootfs/var/cache/* \
        /rootfs/tmp*

FROM scratch
COPY --from=builder /rootfs/ /
