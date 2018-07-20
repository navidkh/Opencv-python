######################################
# INSTALL OPENCV ON UBUNTU OR DEBIAN #
######################################

# |          THIS SCRIPT IS TESTED CORRECTLY ON          |
# |------------------------------------------------------|
# | OS               | OpenCV       | Test | Last test   |
# |------------------|--------------|------|-------------|
# | Ubuntu 18.04 LTS | OpenCV 3.4.2 | OK   | 18 Jul 2018 |
# | Debian 9.5       | OpenCV 3.4.2 | OK   | 18 Jul 2018 |
# |----------------------------------------------------- |
# | Debian 9.0       | OpenCV 3.2.0 | OK   | 25 Jun 2017 |
# | Debian 8.8       | OpenCV 3.2.0 | OK   | 20 May 2017 |
# | Ubuntu 16.04 LTS | OpenCV 3.2.0 | OK   | 20 May 2017 |


# VERSION TO BE INSTALLED

OPENCV_VERSION='3.1.0'


# 1. KEEP UBUNTU OR DEBIAN UP TO DATE

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove


# 2. INSTALL THE DEPENDENCIES

# Build tools:
sudo apt-get install -y build-essential cmake pkg-config

# Media I/O:
sudo apt-get install -y libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev

# Video I/O:
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev

# Parallelism and linear algebra libraries:
sudo apt-get install -y libgtk2.0-dev libatlas-base-dev gfortran

# Python:
sudo apt-get install -y python2.7-dev python3-dev


# 3. INSTALL THE LIBRARY

sudo apt-get install -y unzip wget
wget -O opencv.zip https://github.com/Itseez/opencv/archive/${OPENCV_VERSION}.zip
unzip opencv.zip
rm opencv.zip
mv opencv-${OPENCV_VERSION} opencv
wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/${OPENCV_VERSION}.zip
unzip opencv_contrib.zip
rm opencv_contrib.zip
mv opencv_contrib-${OPENCV_VERSION} opencv_contrib

# Pip
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py

# Numpy
pip install numpy

cd opencv
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D ENABLE_PRECOMPILED_HEADERS=OFF -D INSTALL_PYTHON_EXAMPLES=ON -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules -D BUILD_EXAMPLES=ON -D WITH_FFMPEG=OFF ..
make 
sudo make install
sudo ldconfig

rm -rf opencv opencv_contrib

export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

# 4. EXECUTE SOME OPENCV EXAMPLES AND COMPILE A DEMONSTRATION

# To complete this step, please visit 'http://milq.github.io/install-opencv-ubuntu-debian'.