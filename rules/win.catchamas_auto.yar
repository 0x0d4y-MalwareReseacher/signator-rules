rule win_catchamas_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.catchamas."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.catchamas"
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
        $sequence_0 = { 8b3d???????? 6a0b 68???????? 6a0a 8bf0 }
            // n = 5, score = 200
            //   8b3d????????         |                     
            //   6a0b                 | push                0xb
            //   68????????           |                     
            //   6a0a                 | push                0xa
            //   8bf0                 | mov                 esi, eax

        $sequence_1 = { e8???????? 83c404 85c0 7570 be???????? 8d642400 6880000000 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   85c0                 | test                eax, eax
            //   7570                 | jne                 0x72
            //   be????????           |                     
            //   8d642400             | lea                 esp, [esp]
            //   6880000000           | push                0x80

        $sequence_2 = { 837c241000 751e 53 ff15???????? }
            // n = 4, score = 200
            //   837c241000           | cmp                 dword ptr [esp + 0x10], 0
            //   751e                 | jne                 0x20
            //   53                   | push                ebx
            //   ff15????????         |                     

        $sequence_3 = { 8b44240c 55 8938 e8???????? }
            // n = 4, score = 200
            //   8b44240c             | mov                 eax, dword ptr [esp + 0xc]
            //   55                   | push                ebp
            //   8938                 | mov                 dword ptr [eax], edi
            //   e8????????           |                     

        $sequence_4 = { 751e 85db 7411 8bc3 }
            // n = 4, score = 200
            //   751e                 | jne                 0x20
            //   85db                 | test                ebx, ebx
            //   7411                 | je                  0x13
            //   8bc3                 | mov                 eax, ebx

        $sequence_5 = { 8d442428 48 90 8a4801 40 84c9 75f8 }
            // n = 7, score = 200
            //   8d442428             | lea                 eax, [esp + 0x28]
            //   48                   | dec                 eax
            //   90                   | nop                 
            //   8a4801               | mov                 cl, byte ptr [eax + 1]
            //   40                   | inc                 eax
            //   84c9                 | test                cl, cl
            //   75f8                 | jne                 0xfffffffa

        $sequence_6 = { 8b35???????? 8b4c2418 833900 0f855d050000 8bd1 }
            // n = 5, score = 200
            //   8b35????????         |                     
            //   8b4c2418             | mov                 ecx, dword ptr [esp + 0x18]
            //   833900               | cmp                 dword ptr [ecx], 0
            //   0f855d050000         | jne                 0x563
            //   8bd1                 | mov                 edx, ecx

        $sequence_7 = { 8b842434200000 681f200000 8d4c2411 6a00 51 89442410 }
            // n = 6, score = 200
            //   8b842434200000       | mov                 eax, dword ptr [esp + 0x2034]
            //   681f200000           | push                0x201f
            //   8d4c2411             | lea                 ecx, [esp + 0x11]
            //   6a00                 | push                0
            //   51                   | push                ecx
            //   89442410             | mov                 dword ptr [esp + 0x10], eax

        $sequence_8 = { 66894e14 5e 8b8c2404080000 33cc e8???????? }
            // n = 5, score = 200
            //   66894e14             | mov                 word ptr [esi + 0x14], cx
            //   5e                   | pop                 esi
            //   8b8c2404080000       | mov                 ecx, dword ptr [esp + 0x804]
            //   33cc                 | xor                 ecx, esp
            //   e8????????           |                     

        $sequence_9 = { 83f850 7722 0fb68878124000 ff248d68124000 680e000780 e8???????? 6857000780 }
            // n = 7, score = 200
            //   83f850               | cmp                 eax, 0x50
            //   7722                 | ja                  0x24
            //   0fb68878124000       | movzx               ecx, byte ptr [eax + 0x401278]
            //   ff248d68124000       | jmp                 dword ptr [ecx*4 + 0x401268]
            //   680e000780           | push                0x8007000e
            //   e8????????           |                     
            //   6857000780           | push                0x80070057

    condition:
        7 of them and filesize < 368640
}