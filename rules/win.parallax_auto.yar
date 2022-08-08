rule win_parallax_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.parallax."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.parallax"
        malpedia_rule_date = "20220805"
        malpedia_hash = "6ec06c64bcfdbeda64eff021c766b4ce34542b71"
        malpedia_version = "20220808"
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
        $sequence_0 = { e8???????? 8b550c 8b4f2c 894a08 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   8b4f2c               | mov                 ecx, dword ptr [edi + 0x2c]
            //   894a08               | mov                 dword ptr [edx + 8], ecx

        $sequence_1 = { 83c134 894f1c 8b4d10 894f10 8b750c c7464401000000 8b7d08 }
            // n = 7, score = 200
            //   83c134               | add                 ecx, 0x34
            //   894f1c               | mov                 dword ptr [edi + 0x1c], ecx
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   894f10               | mov                 dword ptr [edi + 0x10], ecx
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   c7464401000000       | mov                 dword ptr [esi + 0x44], 1
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]

        $sequence_2 = { 6a14 68???????? e8???????? 6a04 68???????? 6a12 68???????? }
            // n = 7, score = 200
            //   6a14                 | push                0x14
            //   68????????           |                     
            //   e8????????           |                     
            //   6a04                 | push                4
            //   68????????           |                     
            //   6a12                 | push                0x12
            //   68????????           |                     

        $sequence_3 = { 8945f8 ff75fc ff9698000000 8b7508 6a00 6a34 6a34 }
            // n = 7, score = 200
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff9698000000         | call                dword ptr [esi + 0x98]
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   6a00                 | push                0
            //   6a34                 | push                0x34
            //   6a34                 | push                0x34

        $sequence_4 = { c20800 55 8bec 8b4508 83784400 7505 }
            // n = 6, score = 200
            //   c20800               | ret                 8
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   83784400             | cmp                 dword ptr [eax + 0x44], 0
            //   7505                 | jne                 7

        $sequence_5 = { 3b4e24 7530 ff7510 e8???????? 8b7508 }
            // n = 5, score = 200
            //   3b4e24               | cmp                 ecx, dword ptr [esi + 0x24]
            //   7530                 | jne                 0x32
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   e8????????           |                     
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]

        $sequence_6 = { 6a00 6a00 6804800000 ff7508 ff92e0010000 5d c21000 }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6804800000           | push                0x8004
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff92e0010000         | call                dword ptr [edx + 0x1e0]
            //   5d                   | pop                 ebp
            //   c21000               | ret                 0x10

        $sequence_7 = { 6a00 ff35???????? ff5760 83be8800000000 7411 ffb688000000 }
            // n = 6, score = 200
            //   6a00                 | push                0
            //   ff35????????         |                     
            //   ff5760               | call                dword ptr [edi + 0x60]
            //   83be8800000000       | cmp                 dword ptr [esi + 0x88], 0
            //   7411                 | je                  0x13
            //   ffb688000000         | push                dword ptr [esi + 0x88]

        $sequence_8 = { 662bf6 8b15???????? 3315???????? 03f2 8b1d???????? 331d???????? }
            // n = 6, score = 200
            //   662bf6               | sub                 si, si
            //   8b15????????         |                     
            //   3315????????         |                     
            //   03f2                 | add                 esi, edx
            //   8b1d????????         |                     
            //   331d????????         |                     

        $sequence_9 = { 7505 8b4a3c eb03 8b4a34 8b9e9c000000 85db }
            // n = 6, score = 200
            //   7505                 | jne                 7
            //   8b4a3c               | mov                 ecx, dword ptr [edx + 0x3c]
            //   eb03                 | jmp                 5
            //   8b4a34               | mov                 ecx, dword ptr [edx + 0x34]
            //   8b9e9c000000         | mov                 ebx, dword ptr [esi + 0x9c]
            //   85db                 | test                ebx, ebx

    condition:
        7 of them and filesize < 352256
}