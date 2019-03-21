#!/bin/bash
clear
echo -e "\e[1m\e[92mHDD and VFLASH keys generator v1.3\e[0m"
echo -e "\e[93mBig thanks for all hackers of theirs hard work on RE this shit.\e[0m\n"
echo -e "Install \e[1m\e[93mOpenSSL\e[0m and put \e[1m\e[93meid_root_key.bin\e[0m in the same path as this script.\n"
echo "Choose your PS3 model type:"
echo " 1. retail Fat (CECHyxx with NAND)"
echo " 2. retail Fat (CECHyxx with NOR)"
echo " 3. retail Slim (CECH-2xxx)"
echo " 4. retail late Slim or Super Slim (CECH-3xxx/CECH-4xxx)"
echo " 5. Arcade (GECR-xxxx)"
echo " 6. Debug Kit (DECHyxx/DECH-xxxx)"
echo " 7. Dev Kit (DECR-xxxx)"
echo " 8. test fake keys generating"
echo " 9. exit script"

echo
while :
do
read model
case $model in
    1)
        erk_data=$(xxd -p -u -c 32 -l 32 "eid_root_key.bin")
        erk_iv=$(xxd -p -u -c 16 -s -16 "eid_root_key.bin")
        echo "D92D65DB057D49E1A66F2274B8BAC50883844ED756CA79516362EA8ADAC60326" | xxd -r -p > ata_data_seed.bin
        echo "C3B3B5AACC74CD6A48EFABF44DCDF16E379F55F5777D09FBEEDE07058E94BE08" | xxd -r -p > ata_tweak_seed.bin
        echo "E2D05D4071945B01C36D5151E88CB8334AAA298081D8C44F185DC660ED575686" | xxd -r -p > encdec_data_seed.bin
        echo "02083292C305D538BC50E699710C0A3E55F51CBAA535A38030B67F79C905BDA3" | xxd -r -p > encdec_tweak_seed.bin
        openssl aes-256-cbc -e -in "ata_data_seed.bin" -out "ata_data_key.bin" -K $erk_data -iv $erk_iv -nopad -nosalt
        openssl aes-256-cbc -e -in "ata_tweak_seed.bin" -out "ata_tweak_key.bin" -K $erk_data -iv $erk_iv -nopad -nosalt
        openssl aes-256-cbc -e -in "encdec_data_seed.bin" -out "encdec_data_key.bin" -K $erk_data -iv $erk_iv -nopad -nosalt
        openssl aes-256-cbc -e -in "encdec_tweak_seed.bin" -out "encdec_tweak_key.bin" -K $erk_data -iv $erk_iv -nopad -nosalt
        adk=$(xxd -p -u -c 32 -l 24 ata_data_key.bin)
        atk=$(xxd -p -u -c 32 -l 24 ata_tweak_key.bin)
        edk=$(xxd -p -u -c 32 -l 16 encdec_data_key.bin)
        etk=$(xxd -p -u -c 32 -l 16 encdec_tweak_key.bin)
        echo "$adk" "$atk" | xxd -r -p > hdd_key.bin
        echo "$edk" "$etk" | xxd -r -p > flash_key.bin
        break;;
    2)
        erk_data=$(xxd -p -u -c 32 -l 32 "eid_root_key.bin")
        erk_iv=$(xxd -p -u -c 16 -s -16 "eid_root_key.bin")
        echo "D92D65DB057D49E1A66F2274B8BAC50883844ED756CA79516362EA8ADAC60326" | xxd -r -p > ata_data_seed.bin
        echo "C3B3B5AACC74CD6A48EFABF44DCDF16E379F55F5777D09FBEEDE07058E94BE08" | xxd -r -p > ata_tweak_seed.bin
        echo "E2D05D4071945B01C36D5151E88CB8334AAA298081D8C44F185DC660ED575686" | xxd -r -p > encdec_data_seed.bin
        echo "02083292C305D538BC50E699710C0A3E55F51CBAA535A38030B67F79C905BDA3" | xxd -r -p > encdec_tweak_seed.bin
        openssl aes-256-cbc -e -in "ata_data_seed.bin" -out "ata_data_key.bin" -K $erk_data -iv $erk_iv -nopad -nosalt
        openssl aes-256-cbc -e -in "ata_tweak_seed.bin" -out "ata_tweak_key.bin" -K $erk_data -iv $erk_iv -nopad -nosalt
        openssl aes-256-cbc -e -in "encdec_data_seed.bin" -out "encdec_data_key.bin" -K $erk_data -iv $erk_iv -nopad -nosalt
        openssl aes-256-cbc -e -in "encdec_tweak_seed.bin" -out "encdec_tweak_key.bin" -K $erk_data -iv $erk_iv -nopad -nosalt
        adk=$(xxd -p -u -c 32 -l 24 ata_data_key.bin)
        atk=$(xxd -p -u -c 32 -l 24 ata_tweak_key.bin)
        edk=$(xxd -p -u -c 32 -l 16 encdec_data_key.bin)
        etk=$(xxd -p -u -c 32 -l 16 encdec_tweak_key.bin)
        echo "$adk" "$atk" | xxd -r -p > hdd_key.bin
        echo "$edk" "$etk" | xxd -r -p > vflash_key.bin
        break;;
    3)
        erk_data=$(xxd -p -u -c 32 -l 32 "eid_root_key.bin")
        erk_iv=$(xxd -p -u -c 16 -s -16 "eid_root_key.bin")
        echo "D92D65DB057D49E1A66F2274B8BAC50883844ED756CA79516362EA8ADAC60326" | xxd -r -p > ata_data_seed.bin
        echo "C3B3B5AACC74CD6A48EFABF44DCDF16E379F55F5777D09FBEEDE07058E94BE08" | xxd -r -p > ata_tweak_seed.bin
        echo "E2D05D4071945B01C36D5151E88CB8334AAA298081D8C44F185DC660ED575686" | xxd -r -p > encdec_data_seed.bin
        echo "02083292C305D538BC50E699710C0A3E55F51CBAA535A38030B67F79C905BDA3" | xxd -r -p > encdec_tweak_seed.bin
        openssl aes-256-cbc -e -in "ata_data_seed.bin" -out "ata_data_key.bin" -K $erk_data -iv $erk_iv -nopad -nosalt
        openssl aes-256-cbc -e -in "ata_tweak_seed.bin" -out "ata_tweak_key.bin" -K $erk_data -iv $erk_iv -nopad -nosalt
        openssl aes-256-cbc -e -in "encdec_data_seed.bin" -out "encdec_data_key.bin" -K $erk_data -iv $erk_iv -nopad -nosalt
        openssl aes-256-cbc -e -in "encdec_tweak_seed.bin" -out "encdec_tweak_key.bin" -K $erk_data -iv $erk_iv -nopad -nosalt
        adk=$(xxd -p -u -c 32 -l 16 ata_data_key.bin)
        atk=$(xxd -p -u -c 32 -l 16 ata_tweak_key.bin)
        edk=$(xxd -p -u -c 32 -l 16 encdec_data_key.bin)
        etk=$(xxd -p -u -c 32 -l 16 encdec_tweak_key.bin)
        echo "$adk" "$atk" | xxd -r -p > hdd_key.bin
        echo "$edk" "$etk" | xxd -r -p > vflash_key.bin
        break;;
    4)
        echo -e "\n\e[1m\e[91mSorry, currently internal storage encryption on this models is unknown."
        echo -e "The same as way of obtaining EID Root Key. :(\e[0m"
        break;;
    5)
        echo -e "\n\e[1m\e[91mSorry, currently only seeds can be generated for this model. :(\e[0m"
        echo "DA73ED9020918F4C0A703DCCF890617BFFD25E3340009109583C643DF4A21324" | xxd -r -p > ata_data_and_tweak_seed.bin
        echo "D2BCFF742D571A80DFEE5E2496D19C3A6F25FA0FC69764CAC20F4269EB540FD8" | xxd -r -p > encdec_data_seed.bin
        echo "C19C7F987EDB6E244B07BEDEFA1E6CC9F08524D98C05654CC742141E01F823E1" | xxd -r -p > encdec_tweak_seed.bin
        break;;
    6)
        echo -e "\n\e[1m\e[91mSorry, currently internal storage encryption on this models is unknown. :(\e[0m"
        break;;
    7)
        echo -e "\n\e[1m\e[91mSorry, currently internal storage encryption on this models is unknown. :(\e[0m"
        break;;
    8)
        echo "000102030405060708090A0B0C0D0E0F544553540000544553540000544553540F0E0D0C0B0A09080706050403020100" | xxd -r -p > eid_root_key.fake
        erk_data=$(xxd -p -u -c 32 -l 32 "eid_root_key.fake")
        erk_iv=$(xxd -p -u -c 16 -s -16 "eid_root_key.fake")
        echo "1000000000000000000000000000000000000000000000000000000000000004" | xxd -r -p > ata_data_seed.fake
        echo "2000000000000000000000000000000000000000000000000000000000000003" | xxd -r -p > ata_tweak_seed.fake
        echo "3000000000000000000000000000000000000000000000000000000000000002" | xxd -r -p > encdec_data_seed.fake
        echo "4000000000000000000000000000000000000000000000000000000000000001" | xxd -r -p > encdec_tweak_seed.fake
        openssl aes-256-cbc -e -in "ata_data_seed.fake" -out "ata_data_key.fake" -K $erk_data -iv $erk_iv -nopad -nosalt
        openssl aes-256-cbc -e -in "ata_tweak_seed.fake" -out "ata_tweak_key.fake" -K $erk_data -iv $erk_iv -nopad -nosalt
        openssl aes-256-cbc -e -in "encdec_data_seed.fake" -out "encdec_data_key.fake" -K $erk_data -iv $erk_iv -nopad -nosalt
        openssl aes-256-cbc -e -in "encdec_tweak_seed.fake" -out "encdec_tweak_key.fake" -K $erk_data -iv $erk_iv -nopad -nosalt
        adk=$(xxd -p -u -c 32 -l 16 ata_data_key.fake)
        atk=$(xxd -p -u -c 32 -l 16 ata_tweak_key.fake)
        edk=$(xxd -p -u -c 32 -l 16 encdec_data_key.fake)
        etk=$(xxd -p -u -c 32 -l 16 encdec_tweak_key.fake)
        echo "$adk" "$atk" | xxd -r -p > hdd_key.fake
        echo "$edk" "$etk" | xxd -r -p > vflash_key.fake
        checksum_a=$(crc32 "hdd_key.fake")
        checksum_b=$(crc32 "vflash_key.fake")
        echo -e "\nfake HDD Key checksum should be:      db2768e7"
        echo "Your checksum is:                     $checksum_a"
        echo
        echo "fake VFLASH Key checksum should be:   46e15fbf"
        echo "Your checksum is:                     $checksum_b"
        echo
        echo -e "\e[93mBoth pairs of checksums must be the same. If they are not,"
        echo -e "try different OpenSSL version or another Linux distribution.\e[0m"
        echo
        rm *.fake
        read -p "Press any key to continue."
        break;;
    9)
        exit
        break;;
    *)
        echo
        echo "Write one of the options number..."
        break;;
esac
done
echo
read -p "Done. Press any key to exit. "


# HOWTO:
# losetup loop1 /home/mint/ps3/disk.img
# '/home/mint/ps3/makedev.sh' '/home/mint/ps3/bswap16.elf' /dev/loop1

# for Slim:
# cryptsetup create -c aes-xts-plain64 -d /home/mint/ps3/hdd_key.bin -s 256 ps3hdd /dev/nbd0
# kpartx -a /dev/mapper/ps3hdd
# cryptsetup create -c aes-xts-plain64 -d /home/mint/ps3/vflash_key.bin -s 256 -p 8 ps3vflash /dev/dm-1
# kpartx -a /dev/mapper/ps3vflash

# for Fat (NOR):
# cryptsetup create -c aes-cbc-null -d /home/mint/ps3/hdd_key.bin -s 192 ps3hdd /dev/nbd0
# kpartx -a /dev/mapper/ps3hdd
# cryptsetup create -c aes-xts-plain64 -d /home/mint/ps3/vflash_key.bin -s 256 -p 8 ps3vflash /dev/dm-1
# kpartx -a /dev/mapper/ps3vflash

# for Fat (NAND): ???
# cryptsetup create -c aes-cbc-null -d /home/mint/ps3/hdd_key.bin -s 192 ps3hdd /dev/nbd0
# kpartx -a /dev/mapper/ps3hdd
# cryptsetup create -c aes-cbc-null -d /home/mint/ps3/flash_key.bin -s 128 ps3flash /dev/nbd1
# kpartx -a /dev/mapper/ps3flash

# mount -t ufs -o ufstype=ufs2,ro /dev/dm-2 /home/mint/ps3/dev_hdd0
# mount -t vfat /dev/dm-3 /home/mint/ps3/dev_hdd1
# mount -t vfat /dev/dm-6 /home/mint/ps3/dev_flash1
# mount -t vfat /dev/dm-7 /home/mint/ps3/dev_flash2
# mount -t vfat /dev/dm-8 /home/mint/ps3/dev_flash3

# umount -l /home/mint/ps3/dev_hdd0
# umount -l /home/mint/ps3/dev_hdd1
# umount -l /home/mint/ps3/dev_flash1
# umount -l /home/mint/ps3/dev_flash2
# umount -l /home/mint/ps3/dev_flash3

# kpartx -d /dev/mapper/ps3vflash && cryptsetup remove ps3vflash
# kpartx -d /dev/mapper/ps3hdd && cryptsetup remove ps3hdd
# ./stop-nbd0 && losetup -d /dev/loop1

