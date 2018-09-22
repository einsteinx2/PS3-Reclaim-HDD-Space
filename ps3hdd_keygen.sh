#!/bin/bash
clear
echo -e "\e[1m\e[92mHDD and VFLASH keys generator v1.1\e[0m"
echo -e "\e[93mBig thanks for all hackers of theirs hard work on RE this shit.\e[0m\n"
echo -e "Install \e[1m\e[93mOpenSSL\e[0m and put \e[1m\e[93meid_root_key.bin\e[0m in the same path as this script.\n"
echo "Choose your PS3 model type:"
echo " 1. retail Fat (CECHyxx) & Slim (CECH-2xxx)"
echo " 2. retail late Slim or Super Slim (CECH-3xxx/CECH-4xxx)"
echo " 3. Arcade (GECR-xxxx)"
echo " 4. Debug Kit (DECHyxx/DECH-xxxx)"
echo " 5. Dev Kit (DECR-xxxx)"
echo " 6. test fake keys generating"
echo " 7. exit script"

echo
while :
do
read model
case $model in
    1)
        erk_data=$(xxd -p -u -c 32 -l 32 "eid_root_key.bin")
        erk_iv=$(xxd -p -u -c 16 -s -16 "eid_root_key.bin")
        echo "0: D92D65DB057D49E1A66F2274B8BAC508" | xxd -r > 1.tmp
        echo "0: 83844ED756CA79516362EA8ADAC60326" | xxd -r > 2.tmp
        echo "0: C3B3B5AACC74CD6A48EFABF44DCDF16E" | xxd -r > 3.tmp
        echo "0: 379F55F5777D09FBEEDE07058E94BE08" | xxd -r > 4.tmp
        echo "0: E2D05D4071945B01C36D5151E88CB833" | xxd -r > 5.tmp
        echo "0: 4AAA298081D8C44F185DC660ED575686" | xxd -r > 6.tmp
        echo "0: 02083292C305D538BC50E699710C0A3E" | xxd -r > 7.tmp
        echo "0: 55F51CBAA535A38030B67F79C905BDA3" | xxd -r > 8.tmp
        cat 1.tmp 2.tmp > ata_data_seed.bin
        cat 3.tmp 4.tmp > ata_tweak_seed.bin
        cat 5.tmp 6.tmp > encdec_data_seed.bin
        cat 7.tmp 8.tmp > encdec_tweak_seed.bin
        rm *.tmp
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
    2)
        echo -e "\n\e[1m\e[91mSorry, currently internal storage encryption on this models is unknown."
        echo -e "The same as way of obtaining EID Root Key. :(\e[0m"
        break;;
    3)
        echo -e "\n\e[1m\e[91mSorry, currently only seeds can be generated for this model. :(\e[0m"
        echo "0: DA73ED9020918F4C0A703DCCF890617B" | xxd -r > 1.tmp
        echo "0: FFD25E3340009109583C643DF4A21324" | xxd -r > 2.tmp
        echo "0: D2BCFF742D571A80DFEE5E2496D19C3A" | xxd -r > 3.tmp
        echo "0: 6F25FA0FC69764CAC20F4269EB540FD8" | xxd -r > 4.tmp
        echo "0: C19C7F987EDB6E244B07BEDEFA1E6CC9" | xxd -r > 5.tmp
        echo "0: F08524D98C05654CC742141E01F823E1" | xxd -r > 6.tmp
        cat 1.tmp 2.tmp > ata_data_and_tweak_seed.bin
        cat 3.tmp 4.tmp > encdec_data_seed.bin
        cat 5.tmp 6.tmp > encdec_tweak_seed.bin
        rm *.tmp
        break;;
    4)
        echo -e "\n\e[1m\e[91mSorry, currently internal storage encryption on this models is unknown. :(\e[0m"
        break;;
    5)
        echo -e "\n\e[1m\e[91mSorry, currently internal storage encryption on this models is unknown. :(\e[0m"
        break;;
    6)
        echo "0: 000102030405060708090A0B0C0D0E0F" | xxd -r > a.tmp
        echo "0: 54455354000054455354000054455354" | xxd -r > b.tmp
        echo "0: 0F0E0D0C0B0A09080706050403020100" | xxd -r > c.tmp
        cat a.tmp b.tmp c.tmp > eid_root_key.tmp
        erk_data=$(xxd -p -u -c 32 -l 32 "eid_root_key.tmp")
        erk_iv=$(xxd -p -u -c 16 -s -16 "eid_root_key.tmp")
        echo "0: 10000000000000000000000000000008" | xxd -r > 1.tmp
        echo "0: 20000000000000000000000000000007" | xxd -r > 2.tmp
        echo "0: 30000000000000000000000000000006" | xxd -r > 3.tmp
        echo "0: 40000000000000000000000000000005" | xxd -r > 4.tmp
        echo "0: 50000000000000000000000000000004" | xxd -r > 5.tmp
        echo "0: 60000000000000000000000000000003" | xxd -r > 6.tmp
        echo "0: 70000000000000000000000000000002" | xxd -r > 7.tmp
        echo "0: 80000000000000000000000000000001" | xxd -r > 8.tmp
        cat 1.tmp 2.tmp > ata_data_seed.tmp
        cat 3.tmp 4.tmp > ata_tweak_seed.tmp
        cat 5.tmp 6.tmp > encdec_data_seed.tmp
        cat 7.tmp 8.tmp > encdec_tweak_seed.tmp
        openssl aes-256-cbc -e -in "ata_data_seed.tmp" -out "ata_data_key.tmp" -K $erk_data -iv $erk_iv -nopad -nosalt
        openssl aes-256-cbc -e -in "ata_tweak_seed.tmp" -out "ata_tweak_key.tmp" -K $erk_data -iv $erk_iv -nopad -nosalt
        openssl aes-256-cbc -e -in "encdec_data_seed.tmp" -out "encdec_data_key.tmp" -K $erk_data -iv $erk_iv -nopad -nosalt
        openssl aes-256-cbc -e -in "encdec_tweak_seed.tmp" -out "encdec_tweak_key.tmp" -K $erk_data -iv $erk_iv -nopad -nosalt
        adk=$(xxd -p -u -c 32 -l 16 ata_data_key.tmp)
        atk=$(xxd -p -u -c 32 -l 16 ata_tweak_key.tmp)
        edk=$(xxd -p -u -c 32 -l 16 encdec_data_key.tmp)
        etk=$(xxd -p -u -c 32 -l 16 encdec_tweak_key.tmp)
        echo "$adk" "$atk" | xxd -r -p > hdd_key.tmp
        echo "$edk" "$etk" | xxd -r -p > vflash_key.tmp
        checksum_a=$(crc32 "hdd_key.tmp")
        checksum_b=$(crc32 "vflash_key.tmp")
        echo -e "\nfake HDD Key checksum should be:      c9d34efa"
        echo "Your checksum is:                     $checksum_a"
        echo
        echo "fake VFLASH Key checksum should be:   f5f37ce8"
        echo "Your checksum is:                     $checksum_b"
        echo
        echo -e "\e[93mBoth pairs of checksums must be the same. If they are not,"
        echo -e "try different OpenSSL version or another Linux distribution.\e[0m"
        echo
        read -p "Press any key to continue."
        rm *.tmp
        break;;
    7)
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
