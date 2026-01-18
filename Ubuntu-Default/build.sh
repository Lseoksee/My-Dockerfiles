docker buildx build --platform linux/amd64,linux/arm/v7,linux/arm64/v8,linux/ppc64le,linux/s390x --push -t da864268/my-ubuntu .
docker buildx build --build-arg "BASE_VERSION=22.04" --platform linux/amd64,linux/arm/v7,linux/arm64/v8,linux/ppc64le,linux/s390x --push -t da864268/my-ubuntu:22.04 .

# 빌드 정리
docker buildx prune -f --all
docker rm -f buildx_buildkit_multi-arch-builder0; docker rmi moby/buildkit:buildx-stable-1