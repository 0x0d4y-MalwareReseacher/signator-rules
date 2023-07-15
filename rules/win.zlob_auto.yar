rule win_zlob_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.zlob."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.zlob"
        malpedia_rule_date = "20230705"
        malpedia_hash = "42d0574f4405bd7d2b154d321d345acb18834a41"
        malpedia_version = "20230715"
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
        $sequence_0 = { 8b4c2418 8d440804 50 8bcd e8???????? 84c0 7452 }
            // n = 7, score = 200
            //   8b4c2418             | mov                 ecx, dword ptr [esp + 0x18]
            //   8d440804             | lea                 eax, [eax + ecx + 4]
            //   50                   | push                eax
            //   8bcd                 | mov                 ecx, ebp
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   7452                 | je                  0x54

        $sequence_1 = { 57 68???????? 8d842478010000 50 c644241b00 ff15???????? 8b1d???????? }
            // n = 7, score = 200
            //   57                   | push                edi
            //   68????????           |                     
            //   8d842478010000       | lea                 eax, [esp + 0x178]
            //   50                   | push                eax
            //   c644241b00           | mov                 byte ptr [esp + 0x1b], 0
            //   ff15????????         |                     
            //   8b1d????????         |                     

        $sequence_2 = { 33d2 8a57ff 83e63f 5f }
            // n = 4, score = 200
            //   33d2                 | xor                 edx, edx
            //   8a57ff               | mov                 dl, byte ptr [edi - 1]
            //   83e63f               | and                 esi, 0x3f
            //   5f                   | pop                 edi

        $sequence_3 = { 59 59 8945f4 c645f801 740a 8d45f0 }
            // n = 6, score = 200
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   c645f801             | mov                 byte ptr [ebp - 8], 1
            //   740a                 | je                  0xc
            //   8d45f0               | lea                 eax, [ebp - 0x10]

        $sequence_4 = { ffd6 ffd7 8b442420 85c0 }
            // n = 4, score = 200
            //   ffd6                 | call                esi
            //   ffd7                 | call                edi
            //   8b442420             | mov                 eax, dword ptr [esp + 0x20]
            //   85c0                 | test                eax, eax

        $sequence_5 = { ff7508 ff15???????? 8bf0 83feff 745e 6a0d 8d45ec }
            // n = 7, score = 200
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   83feff               | cmp                 esi, -1
            //   745e                 | je                  0x60
            //   6a0d                 | push                0xd
            //   8d45ec               | lea                 eax, [ebp - 0x14]

        $sequence_6 = { 55 56 57 8be9 c644241300 e8???????? }
            // n = 6, score = 200
            //   55                   | push                ebp
            //   56                   | push                esi
            //   57                   | push                edi
            //   8be9                 | mov                 ebp, ecx
            //   c644241300           | mov                 byte ptr [esp + 0x13], 0
            //   e8????????           |                     

        $sequence_7 = { c3 81ec08010000 53 55 56 57 8d442414 }
            // n = 7, score = 200
            //   c3                   | ret                 
            //   81ec08010000         | sub                 esp, 0x108
            //   53                   | push                ebx
            //   55                   | push                ebp
            //   56                   | push                esi
            //   57                   | push                edi
            //   8d442414             | lea                 eax, [esp + 0x14]

        $sequence_8 = { c20800 837c240400 7413 ff742404 }
            // n = 4, score = 200
            //   c20800               | ret                 8
            //   837c240400           | cmp                 dword ptr [esp + 4], 0
            //   7413                 | je                  0x15
            //   ff742404             | push                dword ptr [esp + 4]

        $sequence_9 = { 8b4504 8b4c2418 8d440804 50 8bcd e8???????? 84c0 }
            // n = 7, score = 200
            //   8b4504               | mov                 eax, dword ptr [ebp + 4]
            //   8b4c2418             | mov                 ecx, dword ptr [esp + 0x18]
            //   8d440804             | lea                 eax, [eax + ecx + 4]
            //   50                   | push                eax
            //   8bcd                 | mov                 ecx, ebp
            //   e8????????           |                     
            //   84c0                 | test                al, al

    condition:
        7 of them and filesize < 98304
}