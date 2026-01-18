docker buildx build --load --build-arg "USER_NAME=seoksee" -t code-server .

# 빌드 정리
docker buildx prune -f --all
docker rm -f buildx_buildkit_multi-arch-builder0; docker rmi moby/buildkit:buildx-stable-1