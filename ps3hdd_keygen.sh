#!/bin/bash
clear
echo -e "\e[1m\e[92mHDD and VFLASH keys generator v0.9\e[0m"
echo -e "\e[93mBig thanks for all hackers of theirs hard work on RE this shit.\e[0m\n"
echo -e "Install \e[1m\e[93mOpenSSL\e[0m and put \e[1m\e[93meid_root_key.bin\e[0m in the same path as this script.\n"
echo "Choose your PS3 model type:"
echo " 1. Fat (CECHxyy/CECHxyy)"
echo " 2. Slim (CECH-2xxx)"
echo " 3. late Slim or Super Slim (CECH-3xxx/CECH-4xxx)"
echo " 4. exit script"
#echo " 5. Arcade (GECR-xxxx)"
echo
while :
do
read model
case $model in
    1)
        echo -e "\n\e[1m\e[91mWarning:\e[0m \e[91mthis key generating method was \e[1mNOT\e[0m \e[91mtested.\e[0m"
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
        adk=$(xxd -p -u -c 32 -l 24 ata_data_key.bin)
        atk=$(xxd -p -u -c 32 -l 24 ata_tweak_key.bin)
        edk=$(xxd -p -u -c 32 -l 16 encdec_data_key.bin)
        etk=$(xxd -p -u -c 32 -l 16 encdec_tweak_key.bin)
        echo "$adk" "$atk" | xxd -r -p > hdd_key.bin
        echo "$edk" "$etk" | xxd -r -p > vflash_key.bin
        break;;
    2)
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
    3)
        echo -e "\n\e[1m\e[91mSorry, curently internal storage encryption on this models is unknown."
        echo -e "The same as way of obtaining EID Root Key. :(\e[0m"
        break;;
    4)
        exit
        break;;
    5)
        echo -e "\n\e[1m\e[91mUnfinished and untested.\e[0m"
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
    *)
        echo "Write one of the options number..."
        break;;
esac
done
echo
read -p "Done. Press any key to exit. "

# //////////////////////////////////////////////////////////////////

# HDD encryption algos, depend on model:
#
# for Fat (NAND models):    AES-CBC-192 (HDD) + AES-CBC-128 (VFLASH)
# for Fat (NOR models):     AES-CBC-192 (HDD) + AES-XTS-128 (VFLASH)
# for Slim:                 AES-XTS-128
# for Super Slim:           ?

# VFLASH partition encryption, depend on model:
#
# for Fat:          by encdec key and zeroed IV (?)
# for Slim:         1st by encdec keys, 2nd by ata keys 
# for Super Slim:   ?

