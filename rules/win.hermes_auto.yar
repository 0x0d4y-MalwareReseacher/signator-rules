rule win_hermes_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.hermes."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.hermes"
        malpedia_rule_date = "20241030"
        malpedia_hash = "26e26953c49c8efafbf72a38076855d578e0a2e4"
        malpedia_version = "20241030"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 6a79 59 f7f1 83c261 }
            // n = 4, score = 200
            //   6a79                 | push                0x79
            //   59                   | pop                 ecx
            //   f7f1                 | div                 ecx
            //   83c261               | add                 edx, 0x61

        $sequence_1 = { ff15???????? 33d2 6a79 59 f7f1 83c261 }
            // n = 6, score = 200
            //   ff15????????         |                     
            //   33d2                 | xor                 edx, edx
            //   6a79                 | push                0x79
            //   59                   | pop                 ecx
            //   f7f1                 | div                 ecx
            //   83c261               | add                 edx, 0x61

        $sequence_2 = { 6810660000 ff75fc ff15???????? 85c0 }
            // n = 4, score = 200
            //   6810660000           | push                0x6610
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_3 = { 50 8d45fc 50 ff15???????? 6a20 }
            // n = 5, score = 200
            //   50                   | push                eax
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   6a20                 | push                0x20

        $sequence_4 = { 83c801 50 6a01 ff75fc ff15???????? }
            // n = 5, score = 200
            //   83c801               | or                  eax, 1
            //   50                   | push                eax
            //   6a01                 | push                1
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff15????????         |                     

        $sequence_5 = { 8b4508 83c801 50 6a01 }
            // n = 4, score = 200
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   83c801               | or                  eax, 1
            //   50                   | push                eax
            //   6a01                 | push                1

        $sequence_6 = { 7508 6a01 ff15???????? 8be5 5d }
            // n = 5, score = 200
            //   7508                 | jne                 0xa
            //   6a01                 | push                1
            //   ff15????????         |                     
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp

        $sequence_7 = { ff15???????? 6a07 59 be???????? }
            // n = 4, score = 200
            //   ff15????????         |                     
            //   6a07                 | push                7
            //   59                   | pop                 ecx
            //   be????????           |                     

        $sequence_8 = { 7508 6a01 ff15???????? 8d45fc 50 }
            // n = 5, score = 200
            //   7508                 | jne                 0xa
            //   6a01                 | push                1
            //   ff15????????         |                     
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax

        $sequence_9 = { 50 6a01 6810660000 ff75fc ff15???????? 85c0 }
            // n = 6, score = 200
            //   50                   | push                eax
            //   6a01                 | push                1
            //   6810660000           | push                0x6610
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

    condition:
        7 of them and filesize < 7192576
}