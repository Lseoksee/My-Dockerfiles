
# BASE_VERSION=latest(24.04), 22.04(CUDA 사용 가능)
# CUDA_VERSION=11.8, 12.1

# CUDA 없이 빌드 
docker buildx build --platform linux/amd64,linux/arm64 --push -t da864268/conda:ubuntu-latest .
docker buildx build --build-arg "BASE_VERSION=22.04" --platform linux/amd64,linux/arm64 --push -t da864268/conda:ubuntu-22.04 .

# 빌드정리 (용량문제 발생가능하므로)
docker buildx prune -f --all
docker rm -f buildx_buildkit_multi-arch-builder0; docker rmi moby/buildkit:buildx-stable-1

# CUDA 빌드 (11.8)
docker buildx build --build-arg "BASE_VERSION=22.04" --build-arg "CUDA_VERSION=11.8" --platform linux/amd64 --push -t da864268/conda:ubuntu-22.04-cuda11.8 .

# 빌드정리 (용량문제 발생가능하므로)
docker buildx prune -f --all
docker rm -f buildx_buildkit_multi-arch-builder0; docker rmi moby/buildkit:buildx-stable-1

# CUDA 빌드 (12.1)
docker buildx build --build-arg "BASE_VERSION=22.04" --build-arg "CUDA_VERSION=12.1" --platform linux/amd64 --push -t da864268/conda:ubuntu-22.04-cuda12.1 .

# 빌드정리 (용량문제 발생가능하므로)
docker buildx prune -f --all
docker rm -f buildx_buildkit_multi-arch-builder0; docker rmi moby/buildkit:buildx-stable-1