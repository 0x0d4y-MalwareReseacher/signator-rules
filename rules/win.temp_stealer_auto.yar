rule win_temp_stealer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.temp_stealer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.temp_stealer"
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
        $sequence_0 = { 48896c2410 4889742418 57 4156 4157 4883ec20 4c635a08 }
            // n = 7, score = 100
            //   48896c2410           | lea                 edi, [0xfffec44c]
            //   4889742418           | test                byte ptr [esp + ecx + 0x40], 6
            //   57                   | je                  0x42e
            //   4156                 | dec                 eax
            //   4157                 | or                  ebx, 0xffffffff
            //   4883ec20             | mov                 ecx, 0x10000
            //   4c635a08             | test                byte ptr [ecx + edx + 0x10], 6

        $sequence_1 = { eb1e 498b8ce9f0940400 8a44f938 a840 7508 0c02 8844f938 }
            // n = 7, score = 100
            //   eb1e                 | dec                 esp
            //   498b8ce9f0940400     | mov                 dword ptr [esp + 0x60], ebp
            //   8a44f938             | dec                 esp
            //   a840                 | mov                 dword ptr [esp + 0x70], ebp
            //   7508                 | dec                 esp
            //   0c02                 | mov                 dword ptr [esp + 0x78], ebp
            //   8844f938             | dec                 eax

        $sequence_2 = { 33c0 4d8bca 49f7d9 8d7801 4903c0 493bc3 774a }
            // n = 7, score = 100
            //   33c0                 | lea                 eax, [0x18443]
            //   4d8bca               | dec                 ecx
            //   49f7d9               | add                 edi, 0x18
            //   8d7801               | jne                 0xec
            //   4903c0               | dec                 eax
            //   493bc3               | lea                 edx, [ebp - 0x24]
            //   774a                 | dec                 eax

        $sequence_3 = { 488bd0 488d4dd0 e8???????? 448bc6 488d55f0 e8???????? 4c8bc0 }
            // n = 7, score = 100
            //   488bd0               | dec                 eax
            //   488d4dd0             | mov                 edx, ebx
            //   e8????????           |                     
            //   448bc6               | nop                 
            //   488d55f0             | dec                 eax
            //   e8????????           |                     
            //   4c8bc0               | mov                 ebx, dword ptr [ebp - 0x59]

        $sequence_4 = { e8???????? 4c8bc0 488d55f0 488d4dd0 e8???????? 488bd0 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   4c8bc0               | mov                 dword ptr [esp + 0x38], ebp
            //   488d55f0             | dec                 esp
            //   488d4dd0             | lea                 ecx, [0x37a69]
            //   e8????????           |                     
            //   488bd0               | mov                 edx, ebx

        $sequence_5 = { 488bd3 4c8d05f6410200 83e23f 488bcb 48c1f906 488d14d2 }
            // n = 6, score = 100
            //   488bd3               | mov                 ebp, esp
            //   4c8d05f6410200       | dec                 eax
            //   83e23f               | sub                 esp, 0x40
            //   488bcb               | dec                 ecx
            //   48c1f906             | mov                 ebx, eax
            //   488d14d2             | dec                 eax

        $sequence_6 = { 7f34 33d2 4d85c9 7e24 498bcd }
            // n = 5, score = 100
            //   7f34                 | lea                 ecx, [ebp + 0x160]
            //   33d2                 | dec                 eax
            //   4d85c9               | mov                 edx, eax
            //   7e24                 | dec                 ecx
            //   498bcd               | mov                 ecx, esi

        $sequence_7 = { 894708 488d5901 41bf20000000 418bc7 48f7e3 498d4fdf 480f40c1 }
            // n = 7, score = 100
            //   894708               | dec                 eax
            //   488d5901             | lea                 ecx, [esp + 0x40]
            //   41bf20000000         | mov                 eax, dword ptr [ebp + 0x218]
            //   418bc7               | test                eax, eax
            //   48f7e3               | jle                 0xffd
            //   498d4fdf             | inc                 ebp
            //   480f40c1             | mov                 esi, ebp

        $sequence_8 = { 83fa08 7d17 4863c2 488d0c80 488d05b39f0300 488d0cc8 }
            // n = 6, score = 100
            //   83fa08               | dec                 eax
            //   7d17                 | mov                 edx, eax
            //   4863c2               | dec                 ecx
            //   488d0c80             | mov                 ecx, esp
            //   488d05b39f0300       | dec                 eax
            //   488d0cc8             | lea                 edx, [ebp - 0x30]

        $sequence_9 = { 8d58b0 498bce 448bc3 488d15f8280100 e8???????? 85c0 7429 }
            // n = 7, score = 100
            //   8d58b0               | dec                 eax
            //   498bce               | mov                 dword ptr [esp + 0x30], 0xb
            //   448bc3               | movsd               qword ptr [esp + 0x20], xmm0
            //   488d15f8280100       | dec                 eax
            //   e8????????           |                     
            //   85c0                 | lea                 edx, [esp + 0x20]
            //   7429                 | dec                 eax

    condition:
        7 of them and filesize < 652288
}