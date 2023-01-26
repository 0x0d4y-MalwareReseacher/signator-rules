rule win_scranos_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.scranos."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.scranos"
        malpedia_rule_date = "20230124"
        malpedia_hash = "2ee0eebba83dce3d019a90519f2f972c0fcf9686"
        malpedia_version = "20230125"
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
        $sequence_0 = { e8???????? 83c404 8b55fc 837a1400 7509 c745f404000000 eb53 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   837a1400             | cmp                 dword ptr [edx + 0x14], 0
            //   7509                 | jne                 0xb
            //   c745f404000000       | mov                 dword ptr [ebp - 0xc], 4
            //   eb53                 | jmp                 0x55

        $sequence_1 = { eba9 83bd5c07000000 741e 8b8d58070000 51 ff15???????? 83c404 }
            // n = 7, score = 100
            //   eba9                 | jmp                 0xffffffab
            //   83bd5c07000000       | cmp                 dword ptr [ebp + 0x75c], 0
            //   741e                 | je                  0x20
            //   8b8d58070000         | mov                 ecx, dword ptr [ebp + 0x758]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   83c404               | add                 esp, 4

        $sequence_2 = { 8b5510 8955c0 eb07 c745c0b0d31410 8b45c0 8945f4 8b4d0c }
            // n = 7, score = 100
            //   8b5510               | mov                 edx, dword ptr [ebp + 0x10]
            //   8955c0               | mov                 dword ptr [ebp - 0x40], edx
            //   eb07                 | jmp                 9
            //   c745c0b0d31410       | mov                 dword ptr [ebp - 0x40], 0x1014d3b0
            //   8b45c0               | mov                 eax, dword ptr [ebp - 0x40]
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]

        $sequence_3 = { 90 3c20 7404 3c09 750e 85ff 740a }
            // n = 7, score = 100
            //   90                   | nop                 
            //   3c20                 | cmp                 al, 0x20
            //   7404                 | je                  6
            //   3c09                 | cmp                 al, 9
            //   750e                 | jne                 0x10
            //   85ff                 | test                edi, edi
            //   740a                 | je                  0xc

        $sequence_4 = { 8bb8dc000000 8b19 3bdd 0f8eb6000000 803f24 0f85ad000000 83fb04 }
            // n = 7, score = 100
            //   8bb8dc000000         | mov                 edi, dword ptr [eax + 0xdc]
            //   8b19                 | mov                 ebx, dword ptr [ecx]
            //   3bdd                 | cmp                 ebx, ebp
            //   0f8eb6000000         | jle                 0xbc
            //   803f24               | cmp                 byte ptr [edi], 0x24
            //   0f85ad000000         | jne                 0xb3
            //   83fb04               | cmp                 ebx, 4

        $sequence_5 = { 8b5508 8b4208 50 8d4df0 51 e8???????? 83c40c }
            // n = 7, score = 100
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8b4208               | mov                 eax, dword ptr [edx + 8]
            //   50                   | push                eax
            //   8d4df0               | lea                 ecx, [ebp - 0x10]
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_6 = { 8b5510 6bd214 03550c 3955fc 7328 8b45fc 0fbe4801 }
            // n = 7, score = 100
            //   8b5510               | mov                 edx, dword ptr [ebp + 0x10]
            //   6bd214               | imul                edx, edx, 0x14
            //   03550c               | add                 edx, dword ptr [ebp + 0xc]
            //   3955fc               | cmp                 dword ptr [ebp - 4], edx
            //   7328                 | jae                 0x2a
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   0fbe4801             | movsx               ecx, byte ptr [eax + 1]

        $sequence_7 = { 8d8d6cffffff e8???????? eb4c 68???????? 8d8d28ffffff e8???????? c745fc02000000 }
            // n = 7, score = 100
            //   8d8d6cffffff         | lea                 ecx, [ebp - 0x94]
            //   e8????????           |                     
            //   eb4c                 | jmp                 0x4e
            //   68????????           |                     
            //   8d8d28ffffff         | lea                 ecx, [ebp - 0xd8]
            //   e8????????           |                     
            //   c745fc02000000       | mov                 dword ptr [ebp - 4], 2

        $sequence_8 = { 8b5508 8b4224 c1e802 83e802 3945e4 7615 6816f10000 }
            // n = 7, score = 100
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8b4224               | mov                 eax, dword ptr [edx + 0x24]
            //   c1e802               | shr                 eax, 2
            //   83e802               | sub                 eax, 2
            //   3945e4               | cmp                 dword ptr [ebp - 0x1c], eax
            //   7615                 | jbe                 0x17
            //   6816f10000           | push                0xf116

        $sequence_9 = { e8???????? 83c408 e9???????? eb9f 8b55fc 0fbf4222 83e007 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   e9????????           |                     
            //   eb9f                 | jmp                 0xffffffa1
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   0fbf4222             | movsx               eax, word ptr [edx + 0x22]
            //   83e007               | and                 eax, 7

    condition:
        7 of them and filesize < 2859008
}