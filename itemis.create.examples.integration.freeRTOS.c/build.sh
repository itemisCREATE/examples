
rm -r build
cmake -B build -DCOMPILER=GCC_POSIX -DFREE_RTOS_PATH=/home/robin/git/FreeRTOS
cd build
make -j16
./create_freeRTOS