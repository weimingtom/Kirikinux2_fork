#0: pc
#1: miyoo a30 and rg28xx
#2: trimui smart pro
#3: trimui brick
MIYOO := 0
#sudo apt install libglfw3-dev libfreetype-dev
#cocos/2d/CCFontFreeType.h

#tvpgl_arm.cpp: && !defined(LINUX)
#CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID
#rw |= O_BINARY;
#defined(LINUX)
#t = __strftime_fmt_1(&buf, &k, *f, tm);
#b src/core/tjs2/tjsConfig.cpp:2494
#b src/core/tjs2/tjsConfig.cpp:2512
#b src/core/tjs2/tjsConfig.cpp:1986


ifeq ($(MIYOO),3)
CC = /home/wmt/work_trimui/aarch64-linux-gnu-7.5.0-linaro/bin/aarch64-linux-gnu-gcc
CPP := /home/wmt/work_trimui/aarch64-linux-gnu-7.5.0-linaro/bin/aarch64-linux-gnu-g++
AR := /home/wmt/work_trimui/aarch64-linux-gnu-7.5.0-linaro/bin/aarch64-linux-gnu-ar cru
RANLIB := /home/wmt/work_trimui/aarch64-linux-gnu-7.5.0-linaro/bin/aarch64-linux-gnu-ranlib 
else ifeq ($(MIYOO),2)
CC = /home/wmt/work_trimui/aarch64-linux-gnu-7.5.0-linaro/bin/aarch64-linux-gnu-gcc
CPP := /home/wmt/work_trimui/aarch64-linux-gnu-7.5.0-linaro/bin/aarch64-linux-gnu-g++
AR := /home/wmt/work_trimui/aarch64-linux-gnu-7.5.0-linaro/bin/aarch64-linux-gnu-ar cru
RANLIB := /home/wmt/work_trimui/aarch64-linux-gnu-7.5.0-linaro/bin/aarch64-linux-gnu-ranlib 
else ifeq ($(MIYOO),1)
CC = /home/wmt/work_a30/gcc-linaro-7.5.0-arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc
CPP := /home/wmt/work_a30/gcc-linaro-7.5.0-arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++
AR := /home/wmt/work_a30/gcc-linaro-7.5.0-arm-linux-gnueabihf/bin/arm-linux-gnueabihf-ar cru
RANLIB := /home/wmt/work_a30/gcc-linaro-7.5.0-arm-linux-gnueabihf/bin/arm-linux-gnueabihf-ranlib 
else
CC  := gcc
CPP := g++
AR  := ar cru
RANLIB := ranlib
endif
RM := rm -rf

CPPFLAGS := 
CPPFLAGS += -I.   
#CPPFLAGS += -g -O2
#CPPFLAGS += -g3 -O0

ifeq ($(MIYOO),3)
#trimui brick
CPPFLAGS += -DUSE_APP_WIDTH=1024
CPPFLAGS += -DUSE_APP_HEIGHT=768
CPPFLAGS += -DUSE_NO_GLFW=1
CPPFLAGS += -DUSE_ROTATE90=0
CPPFLAGS += -g0 -O3
else ifeq ($(MIYOO),2)
#trimui smart pro
CPPFLAGS += -DUSE_APP_WIDTH=1280
CPPFLAGS += -DUSE_APP_HEIGHT=720
CPPFLAGS += -DUSE_NO_GLFW=1
CPPFLAGS += -DUSE_ROTATE90=0
CPPFLAGS += -g0 -O3
else ifeq ($(MIYOO),1)
#miyoo a30 and rg28xx
CPPFLAGS += -DUSE_APP_WIDTH=640
CPPFLAGS += -DUSE_APP_HEIGHT=480
CPPFLAGS += -DUSE_NO_GLFW=1
CPPFLAGS += -DUSE_ROTATE90=1
CPPFLAGS += -g0 -O3
else
#pc
CPPFLAGS += -DUSE_APP_WIDTH=640
CPPFLAGS += -DUSE_APP_HEIGHT=480
CPPFLAGS += -DUSE_NO_GLFW=0 -DUSE_SHADER_PRECISION=1
#if PC use OpenGLES to replace OpenGL, need USE_SHADER_PRECISION
#cocos2d-x debug info [cocos2d: 0:1(1): error: No precision specified in this scope for type `mat4'
CPPFLAGS += -DUSE_ROTATE90=0 -DMY_USE_MINLIB
CPPFLAGS += -g3 -O0
endif

CPPFLAGS += -DCC_ENABLE_BOX2D_INTEGRATION=0 
CPPFLAGS += -DCC_USE_PHYSICS=0 

#3.17.2
CPPFLAGS += -DCC_USE_3D_PHYSICS=0 -DCC_ENABLE_BULLET_INTEGRATION=0 -DCC_USE_NAVMESH=0

#CPPFLAGS += -DCC_USE_WEBP=1
CPPFLAGS += -DCC_USE_WEBP=0
CPPFLAGS += -DCC_USE_TIFF=0
#if USE_FONTCONFIG_LIB

CPPFLAGS += -DGLFW_DLL 
CPPFLAGS += -DLINUX 
CPPFLAGS += -DCOCOS2D_DEBUG=1

CPPFLAGS += -DMY_USE_FREESERIF=1
CPPFLAGS += -DMY_USE_UIBUTTON_SETTITLECOLOR=1

#see below
CPPFLAGS2 := 
#CPPFLAGS2 += -std=c++11 
#CPPFLAGS2 += -std=gnu++14 
#for std::is_floating_point_v and etc
CPPFLAGS2 += -std=gnu++17 

#CPPFLAGS += -fno-exceptions 
CPPFLAGS += -fexceptions 

CPPFLAGS += -Wno-deprecated-declarations 
#only c:
#CPPFLAGS += -Wno-reorder 
CPPFLAGS += -Wall 

#################
#kirikiroid2
CPPFLAGS += -DCC_ENABLE_CHIPMUNK_INTEGRATION=1 -fsigned-char
#only c: -frtti
#
#

#kirikinux
CPPFLAGS += -DKR2_NO_MALLOC_WRAP=1

#################

CPPFLAGS += -Ithird_party/cocos2d-x 
CPPFLAGS += -Ithird_party/cocos2d-x/cocos 
CPPFLAGS += -Ithird_party/cocos2d-x/cocos/platform 
#FIXME:
CPPFLAGS += -Ithird_party/cocos2d-x/cocos/platform/desktop 
CPPFLAGS += -Ithird_party/cocos2d-x/cocos/platform/linux 
CPPFLAGS += -Ithird_party/cocos2d-x/cocos/audio/include 
CPPFLAGS += -Ithird_party/cocos2d-x/cocos/editor-support
CPPFLAGS += -Ithird_party/cocos2d-x/cocos/deprecated 
CPPFLAGS += -Ithird_party/cocos2d-x/extensions 

CPPFLAGS += -Ithird_party/cocos2d-x/external 
CPPFLAGS += -Ithird_party/cocos2d-x/external/ConvertUTF 
CPPFLAGS += -Ithird_party/cocos2d-x/external/poly2tri 
CPPFLAGS += -Ithird_party/cocos2d-x/external/poly2tri/common 
CPPFLAGS += -Ithird_party/cocos2d-x/external/poly2tri/sweep 
CPPFLAGS += -Ithird_party/cocos2d-x/external/edtaa3func 
CPPFLAGS += -Ithird_party/cocos2d-x/external/xxtea 
CPPFLAGS += -Ithird_party/cocos2d-x/external/unzip 
CPPFLAGS += -Ithird_party/cocos2d-x/external/tinyxml2 
CPPFLAGS += -Ithird_party/cocos2d-x/external/xxhash 

CPPFLAGS += -Ithird_party/cocos2d-x/cocos/ui
CPPFLAGS += -Ithird_party/cocos2d-x/cocos/ui/UIEditBox
CPPFLAGS += -Ithird_party/cocos2d-x/cocos/editor-support/cocosbuilder
CPPFLAGS += -Ithird_party/cocos2d-x/cocos/editor-support/cocostudio
CPPFLAGS += -Ithird_party/cocos2d-x/cocos/editor-support/cocostudio/ActionTimeline
CPPFLAGS += -Ithird_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader

#################
#kirikiroid2

#-DLINUX 
#-DLWS_WITH_LIBUV 
#-DTJS_TEXT_OUT_CRLF 
#-DUSE_UNICODE_FSTRING 
#-D_7ZIP_ST 
#-D_GNU_SOURCE 
#-D__STDC_CONSTANT_MACROS 
#-I/home/wmt/Kirikinux2/platform/linux/compat 
#-I/home/wmt/Kirikinux2/src/core 
#-I/home/wmt/Kirikinux2/src/core/base 
#-I/home/wmt/Kirikinux2/src/core/base/win32 
#-I/home/wmt/Kirikinux2/src/core/environ 
#-I/home/wmt/Kirikinux2/src/core/environ/win32 
#-I/home/wmt/Kirikinux2/src/core/environ/sdl 
#-I/home/wmt/Kirikinux2/src/core/msg 
#-I/home/wmt/Kirikinux2/src/core/msg/win32 
#-I/home/wmt/Kirikinux2/src/core/extension 
#-I/home/wmt/Kirikinux2/src/core/sound 
#-I/home/wmt/Kirikinux2/src/core/sound/win32 
#-I/home/wmt/Kirikinux2/src/core/tjs2 
#-I/home/wmt/Kirikinux2/src/core/utils 
#-I/home/wmt/Kirikinux2/src/core/utils/win32 
#-I/home/wmt/Kirikinux2/src/core/visual 
#-I/home/wmt/Kirikinux2/src/core/visual/ARM 
#-I/home/wmt/Kirikinux2/src/core/visual/win32 
#-I/home/wmt/Kirikinux2/src/plugins 
#-I/home/wmt/Kirikinux2/third_party/cocos2d-x 
#-I/home/wmt/Kirikinux2/third_party/cocos2d-x/cocos 
#-I/home/wmt/Kirikinux2/third_party/cocos2d-x/cocos/platform 
#-I/home/wmt/Kirikinux2/third_party/cocos2d-x/cocos/editor-support 
#-I/home/wmt/Kirikinux2/third_party/cocos2d-x/cocos/audio/include 
#-I/home/wmt/Kirikinux2/third_party/cocos2d-x/extensions 
#-I/home/wmt/Kirikinux2/third_party/cocos2d-x/external 
#-I/home/wmt/Kirikinux2/third_party/cocos2d-x/cocos/base 
#-I/home/wmt/Kirikinux2/third_party/cocos2d-x/cocos/platform/linux 
#-I/home/wmt/Kirikinux2/third_party/cocos2d-x/external/recast/.. 
#-I/home/wmt/Kirikinux2/third_party/cocos2d-x/external/tinyxml2/. 
#-I/home/wmt/Kirikinux2/third_party/cocos2d-x/external/xxhash/.
#-I/home/wmt/Kirikinux2/third_party/cocos2d-x/external/xxtea/. 
#-I/home/wmt/Kirikinux2/third_party/cocos2d-x/external/clipper/. 
#-I/home/wmt/Kirikinux2/third_party/cocos2d-x/external/edtaa3func/. 
#-I/home/wmt/Kirikinux2/third_party/cocos2d-x/external/ConvertUTF/. 
#-I/home/wmt/Kirikinux2/third_party/cocos2d-x/external/poly2tri/.. 
#-I/home/wmt/Kirikinux2/third_party/cocos2d-x/external/md5/.. 
#-I/home/wmt/Kirikinux2/third_party/cocos2d-x/external/unzip/. 
#-I/home/wmt/Kirikinux2/third_party 
#-isystem /home/wmt/Kirikinux2/third_party/cocos2d-x/external/webp/include/linux 
#-isystem /home/wmt/Kirikinux2/third_party/cocos2d-x/external/freetype2/include/linux/freetype2 
#-isystem /usr/include/opencv4 
#-isystem /home/wmt/Kirikinux2/third_party/cocos2d-x/external/Box2D/include 
#-isystem /home/wmt/Kirikinux2/third_party/cocos2d-x/external/chipmunk/include 
#-isystem /home/wmt/Kirikinux2/third_party/cocos2d-x/external/uv/include 
#-isystem /home/wmt/Kirikinux2/third_party/cocos2d-x/external/bullet/include 
#-isystem /home/wmt/Kirikinux2/third_party/cocos2d-x/external/bullet/include/bullet 
#-isystem /home/wmt/Kirikinux2/third_party/cocos2d-x/external/openssl/include/linux 
#-isystem /home/wmt/Kirikinux2/third_party/cocos2d-x/external/tiff/include/linux 
#-isystem /home/wmt/Kirikinux2/third_party/cocos2d-x/external/websockets/include/linux 
#-isystem /home/wmt/Kirikinux2/third_party/cocos2d-x/external/linux-specific/fmod/include 
#-isystem /home/wmt/Kirikinux2/third_party/cocos2d-x/external/glfw3/include/linux 
#-isystem /home/wmt/Kirikinux2/third_party/install/ffmpeg4/include 
#-isystem /usr/include/SDL2 
#-isystem /usr/include/AL 
#-isystem /usr/include/opus 
#-isystem /usr/include/libpng16 
#-isystem /usr/include/gtk-3.0 
#-isystem /usr/include/pango-1.0 
#-isystem /usr/include/cairo 
#-isystem /usr/include/gdk-pixbuf-2.0 
#-isystem /usr/include/glycin-2 
#-isystem /usr/include/at-spi2-atk/2.0 
#-isystem /usr/include/at-spi-2.0 
#-isystem /usr/include/atk-1.0 
#-isystem /usr/include/dbus-1.0 
#-isystem /usr/lib/x86_64-linux-gnu/dbus-1.0/include 
#-isystem /usr/include/fribidi 
#-isystem /usr/include/pixman-1 
#-isystem /usr/include/harfbuzz 
#-isystem /usr/include/freetype2 
#-isystem /usr/include/gio-unix-2.0 
#-isystem /usr/include/glib-2.0 
#-isystem /usr/lib/x86_64-linux-gnu/glib-2.0/include 
#-isystem /usr/include/libmount 
#-isystem /usr/include/blkid 
#-isystem /usr/include/sysprof-6 
#-include limits 
#-O2 
#-g 
#-DNDEBUG 
#-std=gnu++14 
#-fPIC 
#-fno-delete-null-pointer-checks 
#-Wno-deprecated-declarations 
#-Wno-unused-result 
#-fpermissive 
#-Wno-narrowing 
#-g1 
#-D_REENTRANT 
#-pthread 

CPPFLAGS += -I./platform/linux/compat 
CPPFLAGS += -I./src/core 
CPPFLAGS += -I./src/core/base 
CPPFLAGS += -I./src/core/base/win32 
CPPFLAGS += -I./src/core/environ 
CPPFLAGS += -I./src/core/environ/win32 
CPPFLAGS += -I./src/core/environ/sdl 
CPPFLAGS += -I./src/core/msg 
CPPFLAGS += -I./src/core/msg/win32 
CPPFLAGS += -I./src/core/extension 
CPPFLAGS += -I./src/core/sound 
CPPFLAGS += -I./src/core/sound/win32 
CPPFLAGS += -I./src/core/tjs2 
CPPFLAGS += -I./src/core/utils 
CPPFLAGS += -I./src/core/utils/win32 
CPPFLAGS += -I./src/core/visual 
CPPFLAGS += -I./src/core/visual/ARM 
CPPFLAGS += -I./src/core/visual/win32 
CPPFLAGS += -I./src/plugins 
CPPFLAGS += -I./third_party/cocos2d-x 
CPPFLAGS += -I./third_party/cocos2d-x/cocos 
CPPFLAGS += -I./third_party/cocos2d-x/cocos/platform 
CPPFLAGS += -I./third_party/cocos2d-x/cocos/editor-support 
CPPFLAGS += -I./third_party/cocos2d-x/cocos/audio/include 
CPPFLAGS += -I./third_party/cocos2d-x/extensions 
CPPFLAGS += -I./third_party/cocos2d-x/external 
CPPFLAGS += -I./third_party/cocos2d-x/cocos/base 
CPPFLAGS += -I./third_party/cocos2d-x/cocos/platform/linux 
CPPFLAGS += -I./third_party/cocos2d-x/external/recast/.. 
CPPFLAGS += -I./third_party/cocos2d-x/external/tinyxml2/. 
CPPFLAGS += -I./third_party/cocos2d-x/external/xxhash/.
CPPFLAGS += -I./third_party/cocos2d-x/external/xxtea/. 
CPPFLAGS += -I./third_party/cocos2d-x/external/clipper/. 
CPPFLAGS += -I./third_party/cocos2d-x/external/edtaa3func/. 
CPPFLAGS += -I./third_party/cocos2d-x/external/ConvertUTF/. 
CPPFLAGS += -I./third_party/cocos2d-x/external/poly2tri/.. 
CPPFLAGS += -I./third_party/cocos2d-x/external/md5/.. 
CPPFLAGS += -I./third_party/cocos2d-x/external/unzip/. 
CPPFLAGS += -I./third_party
CPPFLAGS += -I./src/core/environ/cocos2d

#FIXME:added 
CPPFLAGS += -I./src/plugins/ncbind
CPPFLAGS += -I./src/plugins/ext

#FIXME:from kirikinux2
CPPFLAGS += -DLINUX 
CPPFLAGS += -DLWS_WITH_LIBUV 
CPPFLAGS += -DTJS_TEXT_OUT_CRLF 
CPPFLAGS += -DUSE_UNICODE_FSTRING 
CPPFLAGS += -D_7ZIP_ST 
CPPFLAGS += -D_GNU_SOURCE 
CPPFLAGS += -D__STDC_CONSTANT_MACROS 

#kirikiroid2
#################




#CPPFLAGS += -I/usr/include/webp
#CPPFLAGS += -I/usr/include/i386-linux-gnu 
#CPPFLAGS += -I/home/wmt/work_a30/staging_dir/target/usr/include/GLFW 
#CPPFLAGS += -I/home/wmt/work_a30/staging_dir/target/usr/local/include/GLFW 

ifeq ($(MIYOO),3)
CPPFLAGS += -I/home/wmt/work_trimui/usr/include
CPPFLAGS += -I/home/wmt/work_trimui/usr/include/webp
CPPFLAGS += -I/home/wmt/work_trimui/usr/include/freetype2
else ifeq ($(MIYOO),2)
CPPFLAGS += -I/home/wmt/work_trimui/usr/include
CPPFLAGS += -I/home/wmt/work_trimui/usr/include/webp
CPPFLAGS += -I/home/wmt/work_trimui/usr/include/freetype2
else ifeq ($(MIYOO),1)
CPPFLAGS += -I/home/wmt/work_a30/staging_dir/target/usr/include
CPPFLAGS += -I/home/wmt/work_a30/staging_dir/target/usr/include/webp
CPPFLAGS += -I/home/wmt/work_a30/staging_dir/target/usr/include/freetype2
else
#ubuntu 16 and xubuntu 20
#sudo apt install libglfw3-dev libpng-dev zlib1g-dev libjpeg-dev libfreetype-dev libbz2-dev
CPPFLAGS += -I/usr/include
CPPFLAGS += -I/usr/include/webp
CPPFLAGS += -I/usr/include/freetype2

#FIXME:added
CPPFLAGS += -I/usr/include/opus
CPPFLAGS += -I/usr/include/SDL2
CPPFLAGS += -I/usr/include/opencv4
CPPFLAGS += -I/usr/include/GLFW/
endif



LDFLAGS := 
#LDFLAGS += -lGLU 

#LDFLAGS += -lGL 
#LDFLAGS += -lGLEW 
#LDFLAGS += -lglfw 
#LDFLAGS += -lfontconfig 
#LDFLAGS += -ltiff
#LDFLAGS += -lwebp
#LDFLAGS += -lwebsockets 
#LDFLAGS += -lcurl 
#LDFLAGS += -lX11 

LDFLAGS += -lfreetype -lbz2
#NOTE: -lbz2 is not necessary for PC xubuntu 20.04
LDFLAGS += -lpthread 
LDFLAGS += -lz 
LDFLAGS += -ljpeg 
LDFLAGS += -lpng 
###kirikinux2 not used####LDFLAGS += -lGLESv2 -lEGL

#kirikiroid2
LDFLAGS += -latomic
LDFLAGS += -lSDL2

#kirikinux2
LDFLAGS += -llz4
LDFLAGS += -lonig
LDFLAGS += -lwebp
LDFLAGS += -lturbojpeg
LDFLAGS += -lvorbisfile -lvorbis -lopusfile -lopus -logg
LDFLAGS += -lopencv_imgproc -lopencv_core
LDFLAGS += -lGLU 
LDFLAGS += -lGL 
LDFLAGS += -lGLEW 
LDFLAGS += -lopenal 
LDFLAGS += -ldl

ifeq ($(MIYOO),3)
#trimui brick replace glfw3 with EGL
LDFLAGS += -lIMGegl -lsrv_um -lusc -lglslcompiler -L/home/wmt/work_trimui/usr/lib
else ifeq ($(MIYOO),2)
#trimui smart pro replace glfw3 with EGL
LDFLAGS += -lIMGegl -lsrv_um -lusc -lglslcompiler -L/home/wmt/work_trimui/usr/lib
else ifeq ($(MIYOO),1)
#miyoo a30 replace glfw3 with EGL
LDFLAGS += -L/home/wmt/work_a30/staging_dir/target/usr/lib
else
#xubuntu 16, need glfw3 and EGL
#sudo apt install libglfw3-dev libpng-dev zlib1g-dev libjpeg-dev libfreetype-dev libbz2-dev
LDFLAGS += -lglfw #cocos2dx/platform/linux/CCEGLView.cpp
endif


OBJS := 

#libcocos2d.a
OBJS += third_party/cocos2d-x/cocos/cocos2d.o

#2d
OBJS += third_party/cocos2d-x/cocos/2d/CCAction.o
OBJS += third_party/cocos2d-x/cocos/2d/CCActionCamera.o
OBJS += third_party/cocos2d-x/cocos/2d/CCActionCatmullRom.o
OBJS += third_party/cocos2d-x/cocos/2d/CCActionEase.o
OBJS += third_party/cocos2d-x/cocos/2d/CCActionGrid.o
OBJS += third_party/cocos2d-x/cocos/2d/CCActionGrid3D.o
OBJS += third_party/cocos2d-x/cocos/2d/CCActionInstant.o
OBJS += third_party/cocos2d-x/cocos/2d/CCActionInterval.o
OBJS += third_party/cocos2d-x/cocos/2d/CCActionManager.o
OBJS += third_party/cocos2d-x/cocos/2d/CCActionPageTurn3D.o
OBJS += third_party/cocos2d-x/cocos/2d/CCActionProgressTimer.o
OBJS += third_party/cocos2d-x/cocos/2d/CCActionTiledGrid.o
OBJS += third_party/cocos2d-x/cocos/2d/CCActionTween.o
OBJS += third_party/cocos2d-x/cocos/2d/CCAnimation.o
OBJS += third_party/cocos2d-x/cocos/2d/CCAnimationCache.o
OBJS += third_party/cocos2d-x/cocos/2d/CCAtlasNode.o
OBJS += third_party/cocos2d-x/cocos/2d/CCCamera.o
OBJS += third_party/cocos2d-x/cocos/2d/CCClippingNode.o
OBJS += third_party/cocos2d-x/cocos/2d/CCClippingRectangleNode.o
OBJS += third_party/cocos2d-x/cocos/2d/CCComponent.o
OBJS += third_party/cocos2d-x/cocos/2d/CCComponentContainer.o
OBJS += third_party/cocos2d-x/cocos/2d/CCDrawNode.o
OBJS += third_party/cocos2d-x/cocos/2d/CCDrawingPrimitives.o
OBJS += third_party/cocos2d-x/cocos/2d/CCFont.o
OBJS += third_party/cocos2d-x/cocos/2d/CCFontAtlas.o
OBJS += third_party/cocos2d-x/cocos/2d/CCFontAtlasCache.o
OBJS += third_party/cocos2d-x/cocos/2d/CCFontCharMap.o
OBJS += third_party/cocos2d-x/cocos/2d/CCFontFNT.o
OBJS += third_party/cocos2d-x/cocos/2d/CCFontFreeType.o
OBJS += third_party/cocos2d-x/cocos/2d/CCGLBufferedNode.o
OBJS += third_party/cocos2d-x/cocos/2d/CCGrabber.o
OBJS += third_party/cocos2d-x/cocos/2d/CCGrid.o
OBJS += third_party/cocos2d-x/cocos/2d/CCLabel.o
OBJS += third_party/cocos2d-x/cocos/2d/CCLabelAtlas.o
OBJS += third_party/cocos2d-x/cocos/2d/CCLabelBMFont.o
OBJS += third_party/cocos2d-x/cocos/2d/CCLabelTTF.o
OBJS += third_party/cocos2d-x/cocos/2d/CCLabelTextFormatter.o
OBJS += third_party/cocos2d-x/cocos/2d/CCLayer.o
OBJS += third_party/cocos2d-x/cocos/2d/CCLight.o
OBJS += third_party/cocos2d-x/cocos/2d/CCMenu.o
OBJS += third_party/cocos2d-x/cocos/2d/CCMenuItem.o
OBJS += third_party/cocos2d-x/cocos/2d/CCMotionStreak.o
OBJS += third_party/cocos2d-x/cocos/2d/CCNode.o
OBJS += third_party/cocos2d-x/cocos/2d/CCNodeGrid.o
OBJS += third_party/cocos2d-x/cocos/2d/CCParallaxNode.o
OBJS += third_party/cocos2d-x/cocos/2d/CCParticleBatchNode.o
OBJS += third_party/cocos2d-x/cocos/2d/CCParticleExamples.o
OBJS += third_party/cocos2d-x/cocos/2d/CCParticleSystem.o
OBJS += third_party/cocos2d-x/cocos/2d/CCParticleSystemQuad.o
OBJS += third_party/cocos2d-x/cocos/2d/CCProgressTimer.o
OBJS += third_party/cocos2d-x/cocos/2d/CCProtectedNode.o
OBJS += third_party/cocos2d-x/cocos/2d/CCRenderTexture.o
OBJS += third_party/cocos2d-x/cocos/2d/CCScene.o
OBJS += third_party/cocos2d-x/cocos/2d/CCSprite.o
OBJS += third_party/cocos2d-x/cocos/2d/CCSpriteBatchNode.o
OBJS += third_party/cocos2d-x/cocos/2d/CCSpriteFrame.o
OBJS += third_party/cocos2d-x/cocos/2d/CCSpriteFrameCache.o
#OBJS += third_party/cocos2d-x/cocos/2d/MarchingSquare.o
#OBJS += third_party/cocos2d-x/cocos/2d/SpritePolygon.o
#OBJS += third_party/cocos2d-x/cocos/2d/SpritePolygonCache.o
OBJS += third_party/cocos2d-x/cocos/2d/CCTMXLayer.o
OBJS += third_party/cocos2d-x/cocos/2d/CCFastTMXLayer.o
OBJS += third_party/cocos2d-x/cocos/2d/CCTMXObjectGroup.o
OBJS += third_party/cocos2d-x/cocos/2d/CCTMXTiledMap.o
OBJS += third_party/cocos2d-x/cocos/2d/CCFastTMXTiledMap.o
OBJS += third_party/cocos2d-x/cocos/2d/CCTMXXMLParser.o
OBJS += third_party/cocos2d-x/cocos/2d/CCTextFieldTTF.o
OBJS += third_party/cocos2d-x/cocos/2d/CCTileMapAtlas.o
OBJS += third_party/cocos2d-x/cocos/2d/CCTransition.o
OBJS += third_party/cocos2d-x/cocos/2d/CCTransitionPageTurn.o
OBJS += third_party/cocos2d-x/cocos/2d/CCTransitionProgress.o
OBJS += third_party/cocos2d-x/cocos/2d/CCTweenFunction.o

OBJS += third_party/cocos2d-x/cocos/2d/CCAutoPolygon.o
OBJS += third_party/cocos2d-x/cocos/2d/CCCameraBackgroundBrush.o

OBJS += third_party/cocos2d-x/cocos/3d/CCFrustum.o
OBJS += third_party/cocos2d-x/cocos/3d/CCPlane.o
OBJS += third_party/cocos2d-x/cocos/platform/CCGLView.o
OBJS += third_party/cocos2d-x/cocos/platform/CCFileUtils.o
OBJS += third_party/cocos2d-x/cocos/platform/CCSAXParser.o
OBJS += third_party/cocos2d-x/cocos/platform/CCThread.o
OBJS += third_party/cocos2d-x/cocos/platform/CCImage.o

OBJS += third_party/cocos2d-x/cocos/platform/linux/CCApplication-linux.o
OBJS += third_party/cocos2d-x/cocos/platform/linux/CCCommon-linux.o
OBJS += third_party/cocos2d-x/cocos/platform/linux/CCDevice-linux.o
OBJS += third_party/cocos2d-x/cocos/platform/linux/CCFileUtils-linux.o
OBJS += third_party/cocos2d-x/cocos/platform/linux/CCStdC-linux.o

OBJS += third_party/cocos2d-x/cocos/platform/desktop/CCGLViewImpl-desktop.o

#math
OBJS += third_party/cocos2d-x/cocos/math/CCAffineTransform.o
OBJS += third_party/cocos2d-x/cocos/math/CCGeometry.o
OBJS += third_party/cocos2d-x/cocos/math/CCVertex.o
OBJS += third_party/cocos2d-x/cocos/math/MathUtil.o
OBJS += third_party/cocos2d-x/cocos/math/Mat4.o
OBJS += third_party/cocos2d-x/cocos/math/Quaternion.o
OBJS += third_party/cocos2d-x/cocos/math/TransformUtils.o
OBJS += third_party/cocos2d-x/cocos/math/Vec2.o
OBJS += third_party/cocos2d-x/cocos/math/Vec3.o
OBJS += third_party/cocos2d-x/cocos/math/Vec4.o

#base
OBJS += third_party/cocos2d-x/cocos/base/CCAsyncTaskPool.o
OBJS += third_party/cocos2d-x/cocos/base/CCAutoreleasePool.o
OBJS += third_party/cocos2d-x/cocos/base/CCConfiguration.o
OBJS += third_party/cocos2d-x/cocos/base/CCConsole.o
OBJS += third_party/cocos2d-x/cocos/base/CCData.o
OBJS += third_party/cocos2d-x/cocos/base/CCDataVisitor.o
OBJS += third_party/cocos2d-x/cocos/base/CCDirector.o
OBJS += third_party/cocos2d-x/cocos/base/CCEvent.o
OBJS += third_party/cocos2d-x/cocos/base/CCEventAcceleration.o
OBJS += third_party/cocos2d-x/cocos/base/CCEventCustom.o
OBJS += third_party/cocos2d-x/cocos/base/CCEventDispatcher.o
OBJS += third_party/cocos2d-x/cocos/base/CCEventFocus.o
OBJS += third_party/cocos2d-x/cocos/base/CCEventKeyboard.o
OBJS += third_party/cocos2d-x/cocos/base/CCEventController.o
OBJS += third_party/cocos2d-x/cocos/base/CCEventListener.o
OBJS += third_party/cocos2d-x/cocos/base/CCEventListenerController.o
OBJS += third_party/cocos2d-x/cocos/base/CCEventListenerAcceleration.o
OBJS += third_party/cocos2d-x/cocos/base/CCEventListenerCustom.o
OBJS += third_party/cocos2d-x/cocos/base/CCEventListenerFocus.o
OBJS += third_party/cocos2d-x/cocos/base/CCEventListenerKeyboard.o
OBJS += third_party/cocos2d-x/cocos/base/CCEventListenerMouse.o
OBJS += third_party/cocos2d-x/cocos/base/CCEventListenerTouch.o
OBJS += third_party/cocos2d-x/cocos/base/CCEventMouse.o
OBJS += third_party/cocos2d-x/cocos/base/CCEventTouch.o
OBJS += third_party/cocos2d-x/cocos/base/CCIMEDispatcher.o
OBJS += third_party/cocos2d-x/cocos/base/CCNS.o
OBJS += third_party/cocos2d-x/cocos/base/CCProfiling.o
OBJS += third_party/cocos2d-x/cocos/base/ccRandom.o
OBJS += third_party/cocos2d-x/cocos/base/CCRef.o
OBJS += third_party/cocos2d-x/cocos/base/CCScheduler.o
OBJS += third_party/cocos2d-x/cocos/base/CCScriptSupport.o
OBJS += third_party/cocos2d-x/cocos/base/CCTouch.o
OBJS += third_party/cocos2d-x/cocos/base/CCUserDefault.o
#OBJS += third_party/cocos2d-x/cocos/base/CCUserDefault-android.o
OBJS += third_party/cocos2d-x/cocos/base/CCValue.o
OBJS += third_party/cocos2d-x/cocos/base/TGAlib.o
OBJS += third_party/cocos2d-x/cocos/base/ZipUtils.o
OBJS += third_party/cocos2d-x/cocos/base/atitc.o
OBJS += third_party/cocos2d-x/cocos/base/base64.o
OBJS += third_party/cocos2d-x/cocos/base/ccCArray.o
OBJS += third_party/cocos2d-x/cocos/base/ccFPSImages.o
OBJS += third_party/cocos2d-x/cocos/base/ccTypes.o
OBJS += third_party/cocos2d-x/cocos/base/ccUTF8.o
OBJS += third_party/cocos2d-x/cocos/base/ccUtils.o
OBJS += third_party/cocos2d-x/cocos/base/etc1.o
OBJS += third_party/cocos2d-x/cocos/base/pvr.o
OBJS += third_party/cocos2d-x/cocos/base/s3tc.o
OBJS += third_party/cocos2d-x/cocos/base/CCController.o
#OBJS += third_party/cocos2d-x/cocos/base/CCController-android.o
OBJS += third_party/cocos2d-x/cocos/base/allocator/CCAllocatorDiagnostics.o
OBJS += third_party/cocos2d-x/cocos/base/allocator/CCAllocatorGlobal.o
OBJS += third_party/cocos2d-x/cocos/base/allocator/CCAllocatorGlobalNewDelete.o
OBJS += third_party/cocos2d-x/cocos/base/ObjectFactory.o

#FIXME:added
OBJS += third_party/cocos2d-x/cocos/base/CCStencilStateManager.o

OBJS += third_party/cocos2d-x/cocos/base/CCController-linux-win32.o
OBJS += third_party/cocos2d-x/cocos/base/CCNinePatchImageParser.o
OBJS += third_party/cocos2d-x/cocos/base/CCProperties.o
OBJS += third_party/cocos2d-x/cocos/base/CCUserDefault-winrt.o

#renderer
OBJS += third_party/cocos2d-x/cocos/renderer/CCBatchCommand.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCCustomCommand.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCGLProgram.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCGLProgramCache.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCGLProgramState.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCGLProgramStateCache.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCGroupCommand.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCQuadCommand.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCMeshCommand.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCRenderCommand.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCRenderer.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCTexture2D.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCTextureAtlas.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCTextureCache.o
OBJS += third_party/cocos2d-x/cocos/renderer/ccGLStateCache.o
OBJS += third_party/cocos2d-x/cocos/renderer/ccShaders.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCVertexIndexBuffer.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCVertexIndexData.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCPrimitive.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCPrimitiveCommand.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCTrianglesCommand.o

OBJS += third_party/cocos2d-x/cocos/renderer/CCFrameBuffer.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCMaterial.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCPass.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCRenderState.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCTechnique.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCTextureCube.o
OBJS += third_party/cocos2d-x/cocos/renderer/CCVertexAttribBinding.o

#deprecated
OBJS += third_party/cocos2d-x/cocos/deprecated/CCArray.o
OBJS += third_party/cocos2d-x/cocos/deprecated/CCSet.o
OBJS += third_party/cocos2d-x/cocos/deprecated/CCString.o
OBJS += third_party/cocos2d-x/cocos/deprecated/CCDictionary.o
OBJS += third_party/cocos2d-x/cocos/deprecated/CCDeprecated.o
OBJS += third_party/cocos2d-x/cocos/deprecated/CCNotificationCenter.o

OBJS += third_party/cocos2d-x/external/ConvertUTF/ConvertUTFWrapper.o
OBJS += third_party/cocos2d-x/external/ConvertUTF/ConvertUTF.o

OBJS += third_party/cocos2d-x/external/edtaa3func/edtaa3func.o

OBJS += third_party/cocos2d-x/external/poly2tri/common/shapes.o
OBJS += third_party/cocos2d-x/external/poly2tri/sweep/advancing_front.o
OBJS += third_party/cocos2d-x/external/poly2tri/sweep/cdt.o
OBJS += third_party/cocos2d-x/external/poly2tri/sweep/sweep_context.o
OBJS += third_party/cocos2d-x/external/poly2tri/sweep/sweep.o

#LDFLAGS += ../../lib/libtinyxml2.a 
OBJS += third_party/cocos2d-x/external/tinyxml2/tinyxml2.o

#LDFLAGS += ../../lib/libunzip.a 
OBJS += third_party/cocos2d-x/external/unzip/ioapi_mem.o
OBJS += third_party/cocos2d-x/external/unzip/ioapi.o
OBJS += third_party/cocos2d-x/external/unzip/unzip.o

#LDFLAGS += ../../lib/libxxhash.a 
OBJS += third_party/cocos2d-x/external/xxhash/xxhash.o

OBJS += third_party/cocos2d-x/external/md5/md5.o

OBJS += third_party/cocos2d-x/external/clipper/clipper.o

#ui
OBJS += third_party/cocos2d-x/cocos/ui/UIWidget.o
OBJS += third_party/cocos2d-x/cocos/ui/UILayout.o
OBJS += third_party/cocos2d-x/cocos/ui/UILayoutParameter.o
OBJS += third_party/cocos2d-x/cocos/ui/UILayoutManager.o
OBJS += third_party/cocos2d-x/cocos/ui/CocosGUI.o
OBJS += third_party/cocos2d-x/cocos/ui/UIHelper.o
OBJS += third_party/cocos2d-x/cocos/ui/UIListView.o
OBJS += third_party/cocos2d-x/cocos/ui/UIPageView.o
OBJS += third_party/cocos2d-x/cocos/ui/UIScrollView.o
OBJS += third_party/cocos2d-x/cocos/ui/UIButton.o
OBJS += third_party/cocos2d-x/cocos/ui/UICheckBox.o
OBJS += third_party/cocos2d-x/cocos/ui/UIImageView.o
OBJS += third_party/cocos2d-x/cocos/ui/UIText.o
OBJS += third_party/cocos2d-x/cocos/ui/UITextAtlas.o
OBJS += third_party/cocos2d-x/cocos/ui/UITextBMFont.o
OBJS += third_party/cocos2d-x/cocos/ui/UILoadingBar.o
OBJS += third_party/cocos2d-x/cocos/ui/UISlider.o
OBJS += third_party/cocos2d-x/cocos/ui/UITextField.o
OBJS += third_party/cocos2d-x/cocos/ui/UIRichText.o
OBJS += third_party/cocos2d-x/cocos/ui/UIHBox.o
OBJS += third_party/cocos2d-x/cocos/ui/UIVBox.o
OBJS += third_party/cocos2d-x/cocos/ui/UIRelativeBox.o
OBJS += third_party/cocos2d-x/cocos/ui/UIVideoPlayer-android.o
OBJS += third_party/cocos2d-x/cocos/ui/UIDeprecated.o
OBJS += third_party/cocos2d-x/cocos/ui/UIScale9Sprite.o
OBJS += third_party/cocos2d-x/cocos/ui/UIWebView.o
OBJS += third_party/cocos2d-x/cocos/ui/UIWebViewImpl-android.o
OBJS += third_party/cocos2d-x/cocos/ui/UIEditBox/UIEditBox.o
OBJS += third_party/cocos2d-x/cocos/ui/UIEditBox/UIEditBoxImpl-android.o
OBJS += third_party/cocos2d-x/cocos/ui/UILayoutComponent.o

#FIXME:added
OBJS += third_party/cocos2d-x/cocos/ui/UIScrollViewBar.o
OBJS += third_party/cocos2d-x/cocos/ui/UIAbstractCheckButton.o
OBJS += third_party/cocos2d-x/cocos/ui/UIPageViewIndicator.o
OBJS += third_party/cocos2d-x/cocos/ui/UITabControl.o

#cocosbuilder
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCBAnimationManager.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCBFileLoader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCBKeyframe.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCBReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCBSequence.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCBSequenceProperty.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCControlButtonLoader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCControlLoader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCLabelBMFontLoader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCLabelTTFLoader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCLayerColorLoader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCLayerGradientLoader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCLayerLoader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCMenuItemImageLoader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCMenuItemLoader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCNode+CCBRelativePositioning.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCNodeLoader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCNodeLoaderLibrary.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCParticleSystemQuadLoader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCScale9SpriteLoader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCScrollViewLoader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocosbuilder/CCSpriteLoader.o

#cocosstudio
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCActionFrame.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCActionFrameEasing.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCActionManagerEx.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCActionNode.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCActionObject.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCArmature.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCBone.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCArmatureAnimation.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCProcessBase.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCTween.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCDatas.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCBatchNode.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCDecorativeDisplay.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCDisplayFactory.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCDisplayManager.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCSkin.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCColliderDetector.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCArmatureDataManager.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCArmatureDefine.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCDataReaderHelper.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCSpriteFrameCacheHelper.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCTransformHelp.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCUtilMath.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCComAttribute.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCComAudio.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCComController.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCComRender.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCInputDelegate.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/DictionaryHelper.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCSGUIReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCSSceneReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/TriggerBase.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/TriggerMng.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/TriggerObj.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CocoLoader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/NodeReader/NodeReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/SingleNodeReader/SingleNodeReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/SpriteReader/SpriteReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/ParticleReader/ParticleReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/GameMapReader/GameMapReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/ProjectNodeReader/ProjectNodeReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/ComAudioReader/ComAudioReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/WidgetReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/ButtonReader/ButtonReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/CheckBoxReader/CheckBoxReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/ImageViewReader/ImageViewReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/LayoutReader/LayoutReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/ListViewReader/ListViewReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/LoadingBarReader/LoadingBarReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/PageViewReader/PageViewReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/ScrollViewReader/ScrollViewReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/SliderReader/SliderReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/TextAtlasReader/TextAtlasReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/TextBMFontReader/TextBMFontReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/TextFieldReader/TextFieldReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/TextReader/TextReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/Node3DReader/Node3DReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/Sprite3DReader/Sprite3DReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/UserCameraReader/UserCameraReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/ActionTimeline/CCActionTimelineCache.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/ActionTimeline/CCFrame.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/ActionTimeline/CCTimeLine.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/ActionTimeline/CCActionTimeline.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/ActionTimeline/CCActionTimelineNode.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/ActionTimeline/CSLoader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/FlatBuffersSerialize.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetCallBackHandlerProtocol.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/ArmatureNodeReader/ArmatureNodeReader.o
#OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCObjectExtensionData.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CocoStudio.o

##FIXME:added
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/CCComExtensionData.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/GameNode3DReader/GameNode3DReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/Light3DReader/Light3DReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/TabControlReader/TabControlReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/SkeletonReader/BoneNodeReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/WidgetReader/SkeletonReader/SkeletonNodeReader.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/LocalizationManager.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/ActionTimeline/CCBoneNode.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/ActionTimeline/CCSkeletonNode.o
OBJS += third_party/cocos2d-x/cocos/editor-support/cocostudio/ActionTimeline/CCSkinNode.o



#3d
OBJS += third_party/cocos2d-x/cocos/3d/CCRay.o
OBJS += third_party/cocos2d-x/cocos/3d/CCAABB.o
OBJS += third_party/cocos2d-x/cocos/3d/CCOBB.o
OBJS += third_party/cocos2d-x/cocos/3d/CCAnimate3D.o
OBJS += third_party/cocos2d-x/cocos/3d/CCAnimation3D.o
OBJS += third_party/cocos2d-x/cocos/3d/CCAttachNode.o
OBJS += third_party/cocos2d-x/cocos/3d/CCBillBoard.o
OBJS += third_party/cocos2d-x/cocos/3d/CCBundle3D.o
OBJS += third_party/cocos2d-x/cocos/3d/CCBundleReader.o
OBJS += third_party/cocos2d-x/cocos/3d/CCMesh.o
OBJS += third_party/cocos2d-x/cocos/3d/CCMeshSkin.o
OBJS += third_party/cocos2d-x/cocos/3d/CCMeshVertexIndexData.o
OBJS += third_party/cocos2d-x/cocos/3d/CCSprite3DMaterial.o
OBJS += third_party/cocos2d-x/cocos/3d/CCObjLoader.o
OBJS += third_party/cocos2d-x/cocos/3d/CCSkeleton3D.o
OBJS += third_party/cocos2d-x/cocos/3d/CCSprite3D.o
OBJS += third_party/cocos2d-x/cocos/3d/CCTerrain.o
OBJS += third_party/cocos2d-x/cocos/3d/CCSkybox.o
#OBJS += third_party/cocos2d-x/cocos/3d/CCTextureCube.o

OBJS += third_party/cocos2d-x/cocos/3d/CCMotionStreak3D.o

#extensions ScrollView
OBJS += third_party/cocos2d-x/extensions/GUI/CCControlExtension/CCControl.o
OBJS += third_party/cocos2d-x/extensions/GUI/CCControlExtension/CCControlButton.o
OBJS += third_party/cocos2d-x/extensions/GUI/CCControlExtension/CCControlColourPicker.o
OBJS += third_party/cocos2d-x/extensions/GUI/CCControlExtension/CCControlHuePicker.o
OBJS += third_party/cocos2d-x/extensions/GUI/CCControlExtension/CCControlPotentiometer.o
OBJS += third_party/cocos2d-x/extensions/GUI/CCControlExtension/CCControlSaturationBrightnessPicker.o
OBJS += third_party/cocos2d-x/extensions/GUI/CCControlExtension/CCControlSlider.o
OBJS += third_party/cocos2d-x/extensions/GUI/CCControlExtension/CCControlStepper.o
OBJS += third_party/cocos2d-x/extensions/GUI/CCControlExtension/CCControlSwitch.o
OBJS += third_party/cocos2d-x/extensions/GUI/CCControlExtension/CCControlUtils.o
OBJS += third_party/cocos2d-x/extensions/GUI/CCControlExtension/CCInvocation.o
OBJS += third_party/cocos2d-x/extensions/GUI/CCScrollView/CCScrollView.o
OBJS += third_party/cocos2d-x/extensions/GUI/CCScrollView/CCTableView.o
OBJS += third_party/cocos2d-x/extensions/GUI/CCScrollView/CCTableViewCell.o

#################
#kirikiroid2
KIRIKIROID2_OBJS :=

#libkrkr2core.a
KIRIKIROID2_OBJS += ./src/core/base/7zArchive.o 
KIRIKIROID2_OBJS += ./src/core/base/BinaryStream.o 
KIRIKIROID2_OBJS += ./src/core/base/CharacterSet.o 
KIRIKIROID2_OBJS += ./src/core/base/EventIntf.o 
KIRIKIROID2_OBJS += ./src/core/base/PluginIntf.o 
KIRIKIROID2_OBJS += ./src/core/base/ScriptMgnIntf.o 
KIRIKIROID2_OBJS += ./src/core/base/StorageIntf.o 
KIRIKIROID2_OBJS += ./src/core/base/SysInitIntf.o 
KIRIKIROID2_OBJS += ./src/core/base/SystemIntf.o 
KIRIKIROID2_OBJS += ./src/core/base/TARArchive.o 
KIRIKIROID2_OBJS += ./src/core/base/TextStream.o 
KIRIKIROID2_OBJS += ./src/core/base/UtilStreams.o 
KIRIKIROID2_OBJS += ./src/core/base/XP3Archive.o 
KIRIKIROID2_OBJS += ./src/core/base/ZIPArchive.o 
KIRIKIROID2_OBJS += ./src/core/base/win32/EventImpl.o 
KIRIKIROID2_OBJS += ./src/core/base/win32/FileSelector.o 
KIRIKIROID2_OBJS += ./src/core/base/win32/NativeEventQueue.o 
KIRIKIROID2_OBJS += ./src/core/base/win32/PluginImpl.o 
KIRIKIROID2_OBJS += ./src/core/base/win32/ScriptMgnImpl.o
KIRIKIROID2_OBJS += ./src/core/base/win32/StorageImpl.o 
KIRIKIROID2_OBJS += ./src/core/base/win32/SysInitImpl.o 
KIRIKIROID2_OBJS += ./src/core/base/win32/SystemImpl.o 

KIRIKIROID2_OBJS += ./src/core/environ/Application.o 
KIRIKIROID2_OBJS += ./src/core/environ/ConfigManager/GlobalConfigManager.o 
KIRIKIROID2_OBJS += ./src/core/environ/ConfigManager/IndividualConfigManager.o
KIRIKIROID2_OBJS += ./src/core/environ/ConfigManager/LocaleConfigManager.o 
KIRIKIROID2_OBJS += ./src/core/environ/DetectCPU.o 
KIRIKIROID2_OBJS += ./src/core/environ/DumpSend.o 
KIRIKIROID2_OBJS += ./src/core/environ/cocos2d/AppDelegate.o 
KIRIKIROID2_OBJS += ./src/core/environ/cocos2d/CCKeyCodeConv.o 
KIRIKIROID2_OBJS += ./src/core/environ/cocos2d/CustomFileUtils.o 
KIRIKIROID2_OBJS += ./src/core/environ/cocos2d/MainScene.o 
KIRIKIROID2_OBJS += ./src/core/environ/cocos2d/YUVSprite.o 

KIRIKIROID2_OBJS += ./src/core/environ/linux/Platform.o 

KIRIKIROID2_OBJS += ./src/core/environ/ui/BaseForm.o 
KIRIKIROID2_OBJS += ./src/core/environ/ui/ConsoleWindow.o 
KIRIKIROID2_OBJS += ./src/core/environ/ui/DebugViewLayerForm.o 
KIRIKIROID2_OBJS += ./src/core/environ/ui/DesktopScroll.o 
KIRIKIROID2_OBJS += ./src/core/environ/ui/FileSelectorForm.o 
KIRIKIROID2_OBJS += ./src/core/environ/ui/GameMainMenu.o 
KIRIKIROID2_OBJS += ./src/core/environ/ui/GlobalPreferenceForm.o 
KIRIKIROID2_OBJS += ./src/core/environ/ui/InGameMenuForm.o 
KIRIKIROID2_OBJS += ./src/core/environ/ui/IndividualPreferenceForm.o 
KIRIKIROID2_OBJS += ./src/core/environ/ui/MainFileSelectorForm.o 
KIRIKIROID2_OBJS += ./src/core/environ/ui/MessageBox.o 
KIRIKIROID2_OBJS += ./src/core/environ/ui/PreferenceForm.o 
KIRIKIROID2_OBJS += ./src/core/environ/ui/SeletListForm.o 
KIRIKIROID2_OBJS += ./src/core/environ/ui/SimpleMediaFilePlayer.o 
KIRIKIROID2_OBJS += ./src/core/environ/ui/TipsHelpForm.o 
KIRIKIROID2_OBJS += ./src/core/environ/ui/extension/ActionExtension.o 
KIRIKIROID2_OBJS += ./src/core/environ/ui/extension/UIExtension.o 

KIRIKIROID2_OBJS += ./src/core/extension/Extension.o 

KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/AEChannelInfo.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/AEFactory.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/AEStreamInfo.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/AEUtil.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/AudioCodecFFmpeg.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/AudioCodecPassthrough.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/AudioDevice.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/BaseRenderer.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/BitstreamStats.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/Clock.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/CodecUtils.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/Demux.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/DemuxFFmpeg.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/DemuxPacket.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/FactoryCodec.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/InputStream.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/KRMovieLayer.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/KRMoviePlayer.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/Message.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/MessageQueue.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/ProcessInfo.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/RenderFlags.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/StreamInfo.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/TVPMediaDemux.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/Thread.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/TimeUtils.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/Timer.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/VideoCodec.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/VideoCodecFFmpeg.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/VideoPlayer.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/VideoPlayerAudio.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/VideoPlayerVideo.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/VideoReferenceClock.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/VideoRenderer.o 
KIRIKIROID2_OBJS += ./src/core/movie/ffmpeg/krffmpeg.o 

KIRIKIROID2_OBJS += ./src/core/movie/krmovie.o 

KIRIKIROID2_OBJS += ./src/core/msg/MsgIntf.o 

KIRIKIROID2_OBJS += ./src/core/sound/CDDAIntf.o 
KIRIKIROID2_OBJS += ./src/core/sound/FFWaveDecoder.o 
KIRIKIROID2_OBJS += ./src/core/sound/MIDIIntf.o 
KIRIKIROID2_OBJS += ./src/core/sound/MathAlgorithms.o 
KIRIKIROID2_OBJS += ./src/core/sound/PhaseVocoderDSP.o 
KIRIKIROID2_OBJS += ./src/core/sound/PhaseVocoderFilter.o 
KIRIKIROID2_OBJS += ./src/core/sound/SoundBufferBaseIntf.o 
KIRIKIROID2_OBJS += ./src/core/sound/VorbisWaveDecoder.o 
KIRIKIROID2_OBJS += ./src/core/sound/WaveFormatConverter.o 
KIRIKIROID2_OBJS += ./src/core/sound/WaveIntf.o 
KIRIKIROID2_OBJS += ./src/core/sound/WaveLoopManager.o 
KIRIKIROID2_OBJS += ./src/core/sound/WaveSegmentQueue.o 

KIRIKIROID2_OBJS += ./src/core/sound/win32/CDDAImpl.o 
KIRIKIROID2_OBJS += ./src/core/sound/win32/MIDIImpl.o 
KIRIKIROID2_OBJS += ./src/core/sound/win32/SoundBufferBaseImpl.o 
KIRIKIROID2_OBJS += ./src/core/sound/win32/WaveImpl.o 
KIRIKIROID2_OBJS += ./src/core/sound/win32/WaveMixer.o 
KIRIKIROID2_OBJS += ./src/core/sound/win32/tvpsnd.o 

KIRIKIROID2_OBJS += ./src/core/tjs2/tjs.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjs.tab.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsArray.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsBinarySerializer.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsByteCodeLoader.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsCompileControl.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsConfig.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsConstArrayData.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsDate.o
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsDateParser.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsDebug.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsDictionary.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsDisassemble.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsError.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsException.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsGlobalStringMap.o
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsInterCodeExec.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsInterCodeGen.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsInterface.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsLex.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsMT19937ar-cok.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsMath.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsMessage.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsNamespace.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsNative.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsObject.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsObjectExtendable.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsOctPack.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsRandomGenerator.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsRegExp.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsScriptBlock.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsScriptCache.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsString.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsUtils.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsVariant.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsVariantString.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjsdate.tab.o 
KIRIKIROID2_OBJS += ./src/core/tjs2/tjspp.tab.o 

KIRIKIROID2_OBJS += ./src/core/utils/ClipboardIntf.o 
KIRIKIROID2_OBJS += ./src/core/utils/DebugIntf.o 
KIRIKIROID2_OBJS += ./src/core/utils/KAGParser.o 
KIRIKIROID2_OBJS += ./src/core/utils/MathAlgorithms_Default.o 
KIRIKIROID2_OBJS += ./src/core/utils/MiscUtility.o 
KIRIKIROID2_OBJS += ./src/core/utils/PadIntf.o 
KIRIKIROID2_OBJS += ./src/core/utils/Random.o 
KIRIKIROID2_OBJS += ./src/core/utils/RealFFT_Default.o 
KIRIKIROID2_OBJS += ./src/core/utils/ThreadIntf.o 
KIRIKIROID2_OBJS += ./src/core/utils/TickCount.o 
KIRIKIROID2_OBJS += ./src/core/utils/TimerIntf.o 
KIRIKIROID2_OBJS += ./src/core/utils/VelocityTracker.o 

KIRIKIROID2_OBJS += ./src/core/utils/encoding/gbk2unicode.o 
KIRIKIROID2_OBJS += ./src/core/utils/encoding/jis2unicode.o 

KIRIKIROID2_OBJS += ./src/core/utils/md5.o 
KIRIKIROID2_OBJS += ./src/core/utils/minizip/ioapi.o 
KIRIKIROID2_OBJS += ./src/core/utils/minizip/unzip.o 
KIRIKIROID2_OBJS += ./src/core/utils/minizip/zip.o 

KIRIKIROID2_OBJS += ./src/core/utils/win32/ClipboardImpl.o 
KIRIKIROID2_OBJS += ./src/core/utils/win32/DebugImpl.o 
KIRIKIROID2_OBJS += ./src/core/utils/win32/PadImpl.o 
KIRIKIROID2_OBJS += ./src/core/utils/win32/TVPTimer.o 
KIRIKIROID2_OBJS += ./src/core/utils/win32/ThreadImpl.o 
KIRIKIROID2_OBJS += ./src/core/utils/win32/TimerImpl.o 

KIRIKIROID2_OBJS += ./src/core/visual/BitmapIntf.o 
KIRIKIROID2_OBJS += ./src/core/visual/BitmapLayerTreeOwner.o 
KIRIKIROID2_OBJS += ./src/core/visual/CharacterData.o 
KIRIKIROID2_OBJS += ./src/core/visual/ComplexRect.o 
KIRIKIROID2_OBJS += ./src/core/visual/FontImpl.o 
KIRIKIROID2_OBJS += ./src/core/visual/FontNameTable.o 
KIRIKIROID2_OBJS += ./src/core/visual/FontPicker.o 
KIRIKIROID2_OBJS += ./src/core/visual/FontSystem.o 
KIRIKIROID2_OBJS += ./src/core/visual/FreeType.o 
KIRIKIROID2_OBJS += ./src/core/visual/FreeTypeFontRasterizer.o 
KIRIKIROID2_OBJS += ./src/core/visual/GraphicsLoadThread.o 
KIRIKIROID2_OBJS += ./src/core/visual/GraphicsLoaderIntf.o 
KIRIKIROID2_OBJS += ./src/core/visual/ImageFunction.o 
KIRIKIROID2_OBJS += ./src/core/visual/LayerBitmapIntf.o 
KIRIKIROID2_OBJS += ./src/core/visual/LayerIntf.o 
KIRIKIROID2_OBJS += ./src/core/visual/LayerManager.o 
KIRIKIROID2_OBJS += ./src/core/visual/LayerTreeOwnerImpl.o 
KIRIKIROID2_OBJS += ./src/core/visual/LoadJPEG.o 
KIRIKIROID2_OBJS += ./src/core/visual/LoadPNG.o 
KIRIKIROID2_OBJS += ./src/core/visual/LoadPVRv3.o 
KIRIKIROID2_OBJS += ./src/core/visual/LoadTLG.o 
KIRIKIROID2_OBJS += ./src/core/visual/LoadWEBP.o 
KIRIKIROID2_OBJS += ./src/core/visual/MenuItemIntf.o 
KIRIKIROID2_OBJS += ./src/core/visual/PrerenderedFont.o 
KIRIKIROID2_OBJS += ./src/core/visual/RectItf.o 
KIRIKIROID2_OBJS += ./src/core/visual/RenderManager.o 
KIRIKIROID2_OBJS += ./src/core/visual/SaveTLG5.o 
KIRIKIROID2_OBJS += ./src/core/visual/SaveTLG6.o 
KIRIKIROID2_OBJS += ./src/core/visual/TransIntf.o 
KIRIKIROID2_OBJS += ./src/core/visual/VideoOvlIntf.o 
KIRIKIROID2_OBJS += ./src/core/visual/WindowIntf.o 
KIRIKIROID2_OBJS += ./src/core/visual/argb.o 

KIRIKIROID2_OBJS += ./src/core/visual/gl/ResampleImage.o 
KIRIKIROID2_OBJS += ./src/core/visual/gl/WeightFunctor.o 
KIRIKIROID2_OBJS += ./src/core/visual/gl/blend_function.o 

KIRIKIROID2_OBJS += ./src/core/visual/ogl/RenderManager_ogl.o 
KIRIKIROID2_OBJS += ./src/core/visual/ogl/astcrt.o 
KIRIKIROID2_OBJS += ./src/core/visual/ogl/etcpak.o 
KIRIKIROID2_OBJS += ./src/core/visual/ogl/imagepacker.o 
KIRIKIROID2_OBJS += ./src/core/visual/ogl/pvrtc.o 

KIRIKIROID2_OBJS += ./src/core/visual/tvpgl.o 

KIRIKIROID2_OBJS += ./src/core/visual/win32/BasicDrawDevice.o 
KIRIKIROID2_OBJS += ./src/core/visual/win32/BitmapBitsAlloc.o 
KIRIKIROID2_OBJS += ./src/core/visual/win32/BitmapInfomation.o 
KIRIKIROID2_OBJS += ./src/core/visual/win32/DInputMgn.o 
KIRIKIROID2_OBJS += ./src/core/visual/win32/DrawDevice.o 
KIRIKIROID2_OBJS += ./src/core/visual/win32/GraphicsLoaderImpl.o 
KIRIKIROID2_OBJS += ./src/core/visual/win32/LayerBitmapImpl.o 
KIRIKIROID2_OBJS += ./src/core/visual/win32/LayerImpl.o 
KIRIKIROID2_OBJS += ./src/core/visual/win32/MenuItemImpl.o 
KIRIKIROID2_OBJS += ./src/core/visual/win32/PassThroughDrawDevice.o 
KIRIKIROID2_OBJS += ./src/core/visual/win32/TVPScreen.o 
KIRIKIROID2_OBJS += ./src/core/visual/win32/VideoOvlImpl.o 
KIRIKIROID2_OBJS += ./src/core/visual/win32/WindowImpl.o 
KIRIKIROID2_OBJS += ./src/core/environ/win32/SystemControl.o 
KIRIKIROID2_OBJS += ./src/core/msg/win32/MsgImpl.o 
KIRIKIROID2_OBJS += ./src/core/msg/win32/OptionsDesc.o 

KIRIKIROID2_OBJS += ./platform/linux/LinuxHost.o 
KIRIKIROID2_OBJS += ./platform/linux/LinuxUtils.o 
KIRIKIROID2_OBJS += ./platform/linux/LinuxDialogs.o 
KIRIKIROID2_OBJS += ./platform/linux/LinuxWin32Dialog.o 
KIRIKIROID2_OBJS += ./platform/linux/LinuxFontPicker.o 
KIRIKIROID2_OBJS += ./platform/linux/LinuxFeatureStubs.o 
KIRIKIROID2_OBJS += ./platform/linux/LinuxNoNeonStubs.o


#libkrkr2plugin.a  
KIRIKIROID2_OBJS += ./src/plugins/InternalPlugins.o
KIRIKIROID2_OBJS += ./src/plugins/LayerExBase.o
KIRIKIROID2_OBJS += ./src/plugins/addFont.o
KIRIKIROID2_OBJS += ./src/plugins/csvParser.o
KIRIKIROID2_OBJS += ./src/plugins/dirlist.o
KIRIKIROID2_OBJS += ./src/plugins/extrans.o
KIRIKIROID2_OBJS += ./src/plugins/extrans/mosaic.o
KIRIKIROID2_OBJS += ./src/plugins/extrans/ripple.o
KIRIKIROID2_OBJS += ./src/plugins/extrans/rotatebase.o
KIRIKIROID2_OBJS += ./src/plugins/extrans/rotatetrans.o
KIRIKIROID2_OBJS += ./src/plugins/extrans/turn.o
KIRIKIROID2_OBJS += ./src/plugins/extrans/turntrans_table.o
KIRIKIROID2_OBJS += ./src/plugins/extrans/wave.o
KIRIKIROID2_OBJS += ./src/plugins/fftgraph.o
KIRIKIROID2_OBJS += ./src/plugins/getSample.o
KIRIKIROID2_OBJS += ./src/plugins/getabout.o
KIRIKIROID2_OBJS += ./src/plugins/layerExMovie.o
KIRIKIROID2_OBJS += ./src/plugins/layerExPerspective.o
KIRIKIROID2_OBJS += ./src/plugins/saveStruct.o
KIRIKIROID2_OBJS += ./src/plugins/varfile.o
KIRIKIROID2_OBJS += ./src/plugins/win32dialog.o
KIRIKIROID2_OBJS += ./src/plugins/wutcwf.o
KIRIKIROID2_OBJS += ./src/plugins/xp3filter.o

KIRIKIROID2_OBJS += ./src/plugins/ncbind/ncbind.o

#libkrkr2plugin_ext.a  
KIRIKIROID2_OBJS += ./src/plugins/ext/EmotePlayer.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/MotionPlayerNoD3D.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/TextRender.o 

KIRIKIROID2_OBJS += ./src/plugins/ext/compat/PackinOne.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/compat/getLangName.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/compat/layerExSave.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/compat/win32ole.o 

KIRIKIROID2_OBJS += ./src/plugins/ext/fstat/main.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/kagparserex/KAGParserEx.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/layerExDraw/LayerExDraw.o 

KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/D3DAdaptor.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/EmotePlayer.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/MotionNodeBridge.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/MotionTraceWeb.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/NodeTree.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/PlayerCore.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/PlayerDrawDispatch.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/PlayerFrameProgress.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/PlayerLayerQuery.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/PlayerMotionLoad.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/PlayerRender.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/PlayerRenderExecute.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/PlayerRenderInternal.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/PlayerRenderItems.o
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/PlayerRenderTargets.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/PlayerResource.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/PlayerTimeline.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/PlayerUpdateAnchor.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/PlayerUpdateChildMotion.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/PlayerUpdateGeometry.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/PlayerUpdateLayerEval.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/PlayerUpdateLayers.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/PlayerUpdateParticles.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/PlayerVariable.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/PrivateMotionGLL.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/ResourceManager.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/RuntimeSupport.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/SeparateLayerAdaptor.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/SourceCache.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/motionplayer/main.o 

KIRIKIROID2_OBJS += ./src/plugins/ext/psbfile/PSBFile.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/psbfile/PSBLz4Stream.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/psbfile/PSBMedia.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/psbfile/PSBMediaRegistry.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/psbfile/PSBOffsetReader.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/psbfile/PSBStreamDecompress.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/psbfile/PSBValue.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/psbfile/main.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/psbfile/resources/ImageMetadata.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/psbfile/types/ArchiveType.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/psbfile/types/ImageType.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/psbfile/types/MmoType.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/psbfile/types/MotionType.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/psbfile/types/PimgType.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/psbfile/types/ScnType.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/psbfile/types/SoundArchiveType.o 

KIRIKIROID2_OBJS += ./src/plugins/ext/scriptsEx.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/steam/krkrsteam.o 
KIRIKIROID2_OBJS += ./src/plugins/ext/windowEx.o 

#main()
KIRIKIROID2_OBJS += ./platform/linux/LinuxMain.o 
KIRIKIROID2_OBJS += ./platform/linux/LinuxCrashHandler.o 

#kirikinux2
#################



all : kirikinux2

cocos2dx.a : $(OBJS)
	$(AR) $@ $(OBJS)
	$(RANLIB) $@

kirikinux2: cocos2dx.a $(KIRIKIROID2_OBJS)
	$(CPP) $(KIRIKIROID2_OBJS) cocos2dx.a -o $@ $(CPPFLAGS) $(LDFLAGS)

%.o : %.cpp
	$(CPP) $(CPPFLAGS2) $(CPPFLAGS) -o $@ -c $<

%.o : %.cc
	$(CPP) $(CPPFLAGS2) $(CPPFLAGS) -o $@ -c $<

%.o : %.c
	$(CC) $(CPPFLAGS) -o $@ -c $<
	
test:
	./kirikinux2

debug:
	gdb ./kirikinux2

clean:
	$(RM) $(OBJS) $(KIRIKIROID2_OBJS) cocos2dx.a kirikinux2
