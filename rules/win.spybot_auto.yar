rule win_spybot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.spybot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.spybot"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { 8d855cffffff 6a01 50 e8???????? 83c414 8bf8 }
            // n = 6, score = 100
            //   8d855cffffff         | lea                 eax, dword ptr [ebp - 0xa4]
            //   6a01                 | push                1
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   8bf8                 | mov                 edi, eax

        $sequence_1 = { a3???????? c3 ff742404 ff15???????? 83f8ff 7511 }
            // n = 6, score = 100
            //   a3????????           |                     
            //   c3                   | ret                 
            //   ff742404             | push                dword ptr [esp + 4]
            //   ff15????????         |                     
            //   83f8ff               | cmp                 eax, -1
            //   7511                 | jne                 0x13

        $sequence_2 = { 81ec18070000 56 6800020000 ff7508 8d85e8f8ffff 50 e8???????? }
            // n = 7, score = 100
            //   81ec18070000         | sub                 esp, 0x718
            //   56                   | push                esi
            //   6800020000           | push                0x200
            //   ff7508               | push                dword ptr [ebp + 8]
            //   8d85e8f8ffff         | lea                 eax, dword ptr [ebp - 0x718]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_3 = { 68???????? ebe0 8d0440 be???????? ff348508d44200 68???????? 56 }
            // n = 7, score = 100
            //   68????????           |                     
            //   ebe0                 | jmp                 0xffffffe2
            //   8d0440               | lea                 eax, dword ptr [eax + eax*2]
            //   be????????           |                     
            //   ff348508d44200       | push                dword ptr [eax*4 + 0x42d408]
            //   68????????           |                     
            //   56                   | push                esi

        $sequence_4 = { 53 ff15???????? 85c0 7e38 8d854ceeffff 68???????? 50 }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7e38                 | jle                 0x3a
            //   8d854ceeffff         | lea                 eax, dword ptr [ebp - 0x11b4]
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_5 = { 8d85f0faffff 50 e8???????? 83c428 }
            // n = 4, score = 100
            //   8d85f0faffff         | lea                 eax, dword ptr [ebp - 0x510]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c428               | add                 esp, 0x28

        $sequence_6 = { 50 e8???????? 85c0 59 750a 68???????? e9???????? }
            // n = 7, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   59                   | pop                 ecx
            //   750a                 | jne                 0xc
            //   68????????           |                     
            //   e9????????           |                     

        $sequence_7 = { be80000000 57 8d8588f9ffff 56 50 e8???????? 8d8588f9ffff }
            // n = 7, score = 100
            //   be80000000           | mov                 esi, 0x80
            //   57                   | push                edi
            //   8d8588f9ffff         | lea                 eax, dword ptr [ebp - 0x678]
            //   56                   | push                esi
            //   50                   | push                eax
            //   e8????????           |                     
            //   8d8588f9ffff         | lea                 eax, dword ptr [ebp - 0x678]

        $sequence_8 = { 6a06 eb16 57 68???????? e8???????? 59 85c0 }
            // n = 7, score = 100
            //   6a06                 | push                6
            //   eb16                 | jmp                 0x18
            //   57                   | push                edi
            //   68????????           |                     
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax

        $sequence_9 = { e8???????? 85c0 59 7401 43 81c634020000 47 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   59                   | pop                 ecx
            //   7401                 | je                  3
            //   43                   | inc                 ebx
            //   81c634020000         | add                 esi, 0x234
            //   47                   | inc                 edi

    condition:
        7 of them and filesize < 2367488
}