rule win_electricfish_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.electricfish."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.electricfish"
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
        $sequence_0 = { c3 e8???????? 5d 5f b802000000 5e 8b4c2464 }
            // n = 7, score = 1200
            //   c3                   | ret                 
            //   e8????????           |                     
            //   5d                   | pop                 ebp
            //   5f                   | pop                 edi
            //   b802000000           | mov                 eax, 2
            //   5e                   | pop                 esi
            //   8b4c2464             | mov                 ecx, dword ptr [esp + 0x64]

        $sequence_1 = { c3 2bee 85ff 7459 03f1 8d742eff 03fd }
            // n = 7, score = 1200
            //   c3                   | ret                 
            //   2bee                 | sub                 ebp, esi
            //   85ff                 | test                edi, edi
            //   7459                 | je                  0x5b
            //   03f1                 | add                 esi, ecx
            //   8d742eff             | lea                 esi, [esi + ebp - 1]
            //   03fd                 | add                 edi, ebp

        $sequence_2 = { c744242801000000 83bc245801000000 8b9c2454010000 750d 8b4c2414 51 e8???????? }
            // n = 7, score = 1200
            //   c744242801000000     | mov                 dword ptr [esp + 0x28], 1
            //   83bc245801000000     | cmp                 dword ptr [esp + 0x158], 0
            //   8b9c2454010000       | mov                 ebx, dword ptr [esp + 0x154]
            //   750d                 | jne                 0xf
            //   8b4c2414             | mov                 ecx, dword ptr [esp + 0x14]
            //   51                   | push                ecx
            //   e8????????           |                     

        $sequence_3 = { 8b5c243c 8d442430 50 8d4c241c 51 53 e8???????? }
            // n = 7, score = 1200
            //   8b5c243c             | mov                 ebx, dword ptr [esp + 0x3c]
            //   8d442430             | lea                 eax, [esp + 0x30]
            //   50                   | push                eax
            //   8d4c241c             | lea                 ecx, [esp + 0x1c]
            //   51                   | push                ecx
            //   53                   | push                ebx
            //   e8????????           |                     

        $sequence_4 = { e8???????? 83c40c e9???????? 8bcf 6a10 8d7c2414 e8???????? }
            // n = 7, score = 1200
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   e9????????           |                     
            //   8bcf                 | mov                 ecx, edi
            //   6a10                 | push                0x10
            //   8d7c2414             | lea                 edi, [esp + 0x14]
            //   e8????????           |                     

        $sequence_5 = { e8???????? 8bf8 8bb780010000 85f6 7505 be0f000000 f684b7c000000001 }
            // n = 7, score = 1200
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   8bb780010000         | mov                 esi, dword ptr [edi + 0x180]
            //   85f6                 | test                esi, esi
            //   7505                 | jne                 7
            //   be0f000000           | mov                 esi, 0xf
            //   f684b7c000000001     | test                byte ptr [edi + esi*4 + 0xc0], 1

        $sequence_6 = { e8???????? 8b44243c 8bcb ba80000000 d3fa 8acb 47 }
            // n = 7, score = 1200
            //   e8????????           |                     
            //   8b44243c             | mov                 eax, dword ptr [esp + 0x3c]
            //   8bcb                 | mov                 ecx, ebx
            //   ba80000000           | mov                 edx, 0x80
            //   d3fa                 | sar                 edx, cl
            //   8acb                 | mov                 cl, bl
            //   47                   | inc                 edi

        $sequence_7 = { e8???????? 56 8b742410 8d442404 50 8d4c240c 51 }
            // n = 7, score = 1200
            //   e8????????           |                     
            //   56                   | push                esi
            //   8b742410             | mov                 esi, dword ptr [esp + 0x10]
            //   8d442404             | lea                 eax, [esp + 4]
            //   50                   | push                eax
            //   8d4c240c             | lea                 ecx, [esp + 0xc]
            //   51                   | push                ecx

        $sequence_8 = { e8???????? 83c40c 6800100000 8d95ecefffff 68???????? 52 e8???????? }
            // n = 7, score = 1200
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   6800100000           | push                0x1000
            //   8d95ecefffff         | lea                 edx, [ebp - 0x1014]
            //   68????????           |                     
            //   52                   | push                edx
            //   e8????????           |                     

        $sequence_9 = { 8b5c2418 83ff01 0f8495000000 57 56 85c9 7469 }
            // n = 7, score = 1200
            //   8b5c2418             | mov                 ebx, dword ptr [esp + 0x18]
            //   83ff01               | cmp                 edi, 1
            //   0f8495000000         | je                  0x9b
            //   57                   | push                edi
            //   56                   | push                esi
            //   85c9                 | test                ecx, ecx
            //   7469                 | je                  0x6b

    condition:
        7 of them and filesize < 3162112
}