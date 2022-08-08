rule win_miniasp_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.miniasp."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.miniasp"
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
        $sequence_0 = { 888587f7ffff ff858cf7ffff 80bd87f7ffff00 75e3 8b858cf7ffff 2b8588f7ffff }
            // n = 6, score = 100
            //   888587f7ffff         | mov                 byte ptr [ebp - 0x879], al
            //   ff858cf7ffff         | inc                 dword ptr [ebp - 0x874]
            //   80bd87f7ffff00       | cmp                 byte ptr [ebp - 0x879], 0
            //   75e3                 | jne                 0xffffffe5
            //   8b858cf7ffff         | mov                 eax, dword ptr [ebp - 0x874]
            //   2b8588f7ffff         | sub                 eax, dword ptr [ebp - 0x878]

        $sequence_1 = { ff5020 8945f4 837df400 0f84ba000000 8b45f4 8945e8 8b45e8 }
            // n = 7, score = 100
            //   ff5020               | call                dword ptr [eax + 0x20]
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   837df400             | cmp                 dword ptr [ebp - 0xc], 0
            //   0f84ba000000         | je                  0xc0
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]

        $sequence_2 = { 8b45e0 40 8945ec eba5 8b4588 8b4004 8b405c }
            // n = 7, score = 100
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]
            //   40                   | inc                 eax
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   eba5                 | jmp                 0xffffffa7
            //   8b4588               | mov                 eax, dword ptr [ebp - 0x78]
            //   8b4004               | mov                 eax, dword ptr [eax + 4]
            //   8b405c               | mov                 eax, dword ptr [eax + 0x5c]

        $sequence_3 = { 898568ffffff 8b8568ffffff 8a4001 888567ffffff ff8568ffffff 80bd67ffffff00 75e2 }
            // n = 7, score = 100
            //   898568ffffff         | mov                 dword ptr [ebp - 0x98], eax
            //   8b8568ffffff         | mov                 eax, dword ptr [ebp - 0x98]
            //   8a4001               | mov                 al, byte ptr [eax + 1]
            //   888567ffffff         | mov                 byte ptr [ebp - 0x99], al
            //   ff8568ffffff         | inc                 dword ptr [ebp - 0x98]
            //   80bd67ffffff00       | cmp                 byte ptr [ebp - 0x99], 0
            //   75e2                 | jne                 0xffffffe4

        $sequence_4 = { 2b85d4ebffff 8985ccebffff 740e 8d85f8f7ffff 8985c8ebffff eb09 }
            // n = 6, score = 100
            //   2b85d4ebffff         | sub                 eax, dword ptr [ebp - 0x142c]
            //   8985ccebffff         | mov                 dword ptr [ebp - 0x1434], eax
            //   740e                 | je                  0x10
            //   8d85f8f7ffff         | lea                 eax, [ebp - 0x808]
            //   8985c8ebffff         | mov                 dword ptr [ebp - 0x1438], eax
            //   eb09                 | jmp                 0xb

        $sequence_5 = { 6a08 8b4de8 e8???????? 50 6a0a 8b4de8 e8???????? }
            // n = 7, score = 100
            //   6a08                 | push                8
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   e8????????           |                     
            //   50                   | push                eax
            //   6a0a                 | push                0xa
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   e8????????           |                     

        $sequence_6 = { 8bbd68ffffff 8bb570ffffff 8b856cffffff 8bc8 c1e902 f3a5 }
            // n = 6, score = 100
            //   8bbd68ffffff         | mov                 edi, dword ptr [ebp - 0x98]
            //   8bb570ffffff         | mov                 esi, dword ptr [ebp - 0x90]
            //   8b856cffffff         | mov                 eax, dword ptr [ebp - 0x94]
            //   8bc8                 | mov                 ecx, eax
            //   c1e902               | shr                 ecx, 2
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]

        $sequence_7 = { 48 83c8fc 40 8b048530f04000 894580 ff7580 }
            // n = 6, score = 100
            //   48                   | dec                 eax
            //   83c8fc               | or                  eax, 0xfffffffc
            //   40                   | inc                 eax
            //   8b048530f04000       | mov                 eax, dword ptr [eax*4 + 0x40f030]
            //   894580               | mov                 dword ptr [ebp - 0x80], eax
            //   ff7580               | push                dword ptr [ebp - 0x80]

        $sequence_8 = { 8808 8b853cffffff 40 89853cffffff 8b8538ffffff 40 }
            // n = 6, score = 100
            //   8808                 | mov                 byte ptr [eax], cl
            //   8b853cffffff         | mov                 eax, dword ptr [ebp - 0xc4]
            //   40                   | inc                 eax
            //   89853cffffff         | mov                 dword ptr [ebp - 0xc4], eax
            //   8b8538ffffff         | mov                 eax, dword ptr [ebp - 0xc8]
            //   40                   | inc                 eax

        $sequence_9 = { 807dd700 75ef 8b45dc 2b45d8 8945d0 ff75fc ff75f8 }
            // n = 7, score = 100
            //   807dd700             | cmp                 byte ptr [ebp - 0x29], 0
            //   75ef                 | jne                 0xfffffff1
            //   8b45dc               | mov                 eax, dword ptr [ebp - 0x24]
            //   2b45d8               | sub                 eax, dword ptr [ebp - 0x28]
            //   8945d0               | mov                 dword ptr [ebp - 0x30], eax
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff75f8               | push                dword ptr [ebp - 8]

    condition:
        7 of them and filesize < 139264
}