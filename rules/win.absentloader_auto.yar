rule win_absentloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.absentloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.absentloader"
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
        $sequence_0 = { 57 bfb0a606fd 8d75f0 68fb0605fd a5 a5 66a5 }
            // n = 7, score = 200
            //   57                   | push                edi
            //   bfb0a606fd           | mov                 edi, 0xfd06a6b0
            //   8d75f0               | lea                 esi, dword ptr [ebp - 0x10]
            //   68fb0605fd           | push                0xfd0506fb
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   66a5                 | movsw               word ptr es:[edi], word ptr [esi]

        $sequence_1 = { a5 a5 894310 894314 5e 894110 897114 }
            // n = 7, score = 200
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   894310               | mov                 dword ptr [ebx + 0x10], eax
            //   894314               | mov                 dword ptr [ebx + 0x14], eax
            //   5e                   | pop                 esi
            //   894110               | mov                 dword ptr [ecx + 0x10], eax
            //   897114               | mov                 dword ptr [ecx + 0x14], esi

        $sequence_2 = { 885d9c e8???????? 8d459c c645fc26 50 6a0b 8d8574ffffff }
            // n = 7, score = 200
            //   885d9c               | mov                 byte ptr [ebp - 0x64], bl
            //   e8????????           |                     
            //   8d459c               | lea                 eax, dword ptr [ebp - 0x64]
            //   c645fc26             | mov                 byte ptr [ebp - 4], 0x26
            //   50                   | push                eax
            //   6a0b                 | push                0xb
            //   8d8574ffffff         | lea                 eax, dword ptr [ebp - 0x8c]

        $sequence_3 = { 751d 68a5100000 6830f405fd 68841506fd e8???????? 8b750c 83c40c }
            // n = 7, score = 200
            //   751d                 | jne                 0x1f
            //   68a5100000           | push                0x10a5
            //   6830f405fd           | push                0xfd05f430
            //   68841506fd           | push                0xfd061584
            //   e8????????           |                     
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   83c40c               | add                 esp, 0xc

        $sequence_4 = { 83ec18 c645fc32 8bcc 8d855cfbffff 50 895910 895914 }
            // n = 7, score = 200
            //   83ec18               | sub                 esp, 0x18
            //   c645fc32             | mov                 byte ptr [ebp - 4], 0x32
            //   8bcc                 | mov                 ecx, esp
            //   8d855cfbffff         | lea                 eax, dword ptr [ebp - 0x4a4]
            //   50                   | push                eax
            //   895910               | mov                 dword ptr [ecx + 0x10], ebx
            //   895914               | mov                 dword ptr [ecx + 0x14], ebx

        $sequence_5 = { 8b3f 8b4638 03c7 3945f8 7417 6868200000 6830f405fd }
            // n = 7, score = 200
            //   8b3f                 | mov                 edi, dword ptr [edi]
            //   8b4638               | mov                 eax, dword ptr [esi + 0x38]
            //   03c7                 | add                 eax, edi
            //   3945f8               | cmp                 dword ptr [ebp - 8], eax
            //   7417                 | je                  0x19
            //   6868200000           | push                0x2068
            //   6830f405fd           | push                0xfd05f430

        $sequence_6 = { 8816 5f 8d4601 5e 5b c3 55 }
            // n = 7, score = 200
            //   8816                 | mov                 byte ptr [esi], dl
            //   5f                   | pop                 edi
            //   8d4601               | lea                 eax, dword ptr [esi + 1]
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   c3                   | ret                 
            //   55                   | push                ebp

        $sequence_7 = { e8???????? 8b4e08 8b49fc e8???????? 8b4604 bf30f405fd }
            // n = 6, score = 200
            //   e8????????           |                     
            //   8b4e08               | mov                 ecx, dword ptr [esi + 8]
            //   8b49fc               | mov                 ecx, dword ptr [ecx - 4]
            //   e8????????           |                     
            //   8b4604               | mov                 eax, dword ptr [esi + 4]
            //   bf30f405fd           | mov                 edi, 0xfd05f430

        $sequence_8 = { 8d8db4f9ffff 53 e8???????? 83ec18 c645fc18 8bcc 89a590faffff }
            // n = 7, score = 200
            //   8d8db4f9ffff         | lea                 ecx, dword ptr [ebp - 0x64c]
            //   53                   | push                ebx
            //   e8????????           |                     
            //   83ec18               | sub                 esp, 0x18
            //   c645fc18             | mov                 byte ptr [ebp - 4], 0x18
            //   8bcc                 | mov                 ecx, esp
            //   89a590faffff         | mov                 dword ptr [ebp - 0x570], esp

        $sequence_9 = { 0f118520faffff 8b848d20faffff 83e829 6bc029 99 f7fe 8d0416 }
            // n = 7, score = 200
            //   0f118520faffff       | movups              xmmword ptr [ebp - 0x5e0], xmm0
            //   8b848d20faffff       | mov                 eax, dword ptr [ebp + ecx*4 - 0x5e0]
            //   83e829               | sub                 eax, 0x29
            //   6bc029               | imul                eax, eax, 0x29
            //   99                   | cdq                 
            //   f7fe                 | idiv                esi
            //   8d0416               | lea                 eax, dword ptr [esi + edx]

    condition:
        7 of them and filesize < 794624
}