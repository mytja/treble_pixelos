<p align="center">
  <img src="https://avatars.githubusercontent.com/u/82160282?s=200&v=4">
</p>

### Building
You'll need to get familiar with [Git and Repo](https://source.android.com/source/using-repo.html), as well as [How to build a GSI](https://github.com/TrebleDroid/treble_experimentations/wiki/How-to-build-a-GSI%3F).

## Create Directories
As a first step, you'll have to create and enter a folder with the appropriate name.
To do that, run these commands:

```bash
mkdir ~/pixelos
cd ~/pixelos
```

## Initalize the Treble PixelOS repo
```bash
repo init --depth=1 -u https://github.com/PixelOS-AOSP/manifest.git -b fifteen --git-lfs
```

## Clone the Manifest
This adds necessary dependencies for the PixelOS GSI.
```bash
git clone https://github.com/mytja/treble_manifest.git -b pixelos-fifteen .repo/local_manifests
```

## Sync the repository
```bash
repo sync -c --force-sync --no-clone-bundle --no-tags -j$(nproc --all)
```

### Apply the patches
Run this command in the ROM folder:
```bash
./patches/apply-all.sh .
```

This command will apply all TrebleDroid and personal patches. If any patch fails to apply correctly, as indicated by `### FAILED APPLYING` output, you need to apply the patch manually. Steps to do so are described in short on [treble_pixelos_patches repo](https://github.com/mytja/treble_pixelos_patches/blob/fifteen/README.md).

### Turn On Caching
You can speed up subsequent builds by adding these lines to your `~/.bashrc` OR `~/.zshrc` file:

```bash
export USE_CCACHE=1
export CCACHE_COMPRESS=1
export CCACHE_MAXSIZE=50G # 50 GB
```

## Build Treble app
This GSI uses a modified Treble app in order to achieve more functionality. You need to build the Treble app.
```bash
cd ~/pixelos/treble_app

./build.sh release
```

## Compilation 
In the ROM folder (`~/pixelos`), run this to start compilation:

```bash
source build/envsetup.sh

ccache -M 50G -F 0

lunch pixelos_arm64_bgN_erofs-bp1a-userdebug 

make systemimage -j$(nproc --all)
```

## Compression
After compiling the GSI, you can run this to reduce the `system.img` file size:
> [!WARNING]
> You will need to decompress the output file to flash the `system.img`. In other words, you cannot flash this file directly.

```bash
cd out/target/product/tdgsi_arm64_ab
xz -9 -T0 -v -z system.img 
```

## Troubleshooting
If you face any conflicts while applying patches, apply the patch manually.
For any other issues, report them via the [Issues](https://github.com/mytja/treble_pixelos/issues) tab.

## Credits
These people have helped this project in some way or another, so they should be the ones who receive all the credit:
- [PixelOS Team](https://github.com/PixelOS)
- [Phhusson](https://github.com/phhusson)
- [AndyYan](https://github.com/AndyCGYan)
- [Ponces](https://github.com/ponces)
- [Peter Cai](https://github.com/PeterCxy)
- [Iceows](https://github.com/Iceows)
- [ChonDoit](https://github.com/ChonDoit)
- [Nazim](https://github.com/naz664)
- [UniversalX](https://github.com/orgs/UniversalX-devs/)
- [TQMatvey](https://github.com/TQMatvey)
- [Ahnet](https://github.com/ahnet-69)
- [Christopher A. Williamson](https://github.com/cawilliamson)
- [kaii](https://github.com/kaii-lb)
