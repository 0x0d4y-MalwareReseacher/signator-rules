rule win_lethic_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.lethic."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lethic"
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
        $sequence_0 = { 8b45f8 83c001 8945f8 ebda 8b45f0 }
            // n = 5, score = 1200
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   83c001               | add                 eax, 1
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   ebda                 | jmp                 0xffffffdc
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]

        $sequence_1 = { 894804 8b55fc c7823410000001000000 6a10 8b450c }
            // n = 5, score = 1200
            //   894804               | mov                 dword ptr [eax + 4], ecx
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   c7823410000001000000     | mov    dword ptr [edx + 0x1034], 1
            //   6a10                 | push                0x10
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]

        $sequence_2 = { 8bec 83ec10 8b4508 8945fc 8b4dfc 894df0 8b550c }
            // n = 7, score = 1200
            //   8bec                 | mov                 ebp, esp
            //   83ec10               | sub                 esp, 0x10
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   894df0               | mov                 dword ptr [ebp - 0x10], ecx
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]

        $sequence_3 = { 55 8bec 83ec10 8b4508 8945fc 8b4dfc 894df0 }
            // n = 7, score = 1200
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec10               | sub                 esp, 0x10
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   894df0               | mov                 dword ptr [ebp - 0x10], ecx

        $sequence_4 = { c7823410000001000000 6a10 8b450c 50 8b4dfc }
            // n = 5, score = 1200
            //   c7823410000001000000     | mov    dword ptr [edx + 0x1034], 1
            //   6a10                 | push                0x10
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   50                   | push                eax
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]

        $sequence_5 = { 740a 8b45fc 8b08 894dfc }
            // n = 4, score = 1200
            //   740a                 | je                  0xc
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx

        $sequence_6 = { ffd2 8b4dfc 894118 8b55fc 837a18ff 7420 8d45f8 }
            // n = 7, score = 1200
            //   ffd2                 | call                edx
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   894118               | mov                 dword ptr [ecx + 0x18], eax
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   837a18ff             | cmp                 dword ptr [edx + 0x18], -1
            //   7420                 | je                  0x22
            //   8d45f8               | lea                 eax, [ebp - 8]

        $sequence_7 = { 8b45fc 8b4d10 894804 8b55fc c7823410000001000000 }
            // n = 5, score = 1200
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   894804               | mov                 dword ptr [eax + 4], ecx
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   c7823410000001000000     | mov    dword ptr [edx + 0x1034], 1

        $sequence_8 = { ffd1 83f8ff 7513 8b55fc 52 }
            // n = 5, score = 1200
            //   ffd1                 | call                ecx
            //   83f8ff               | cmp                 eax, -1
            //   7513                 | jne                 0x15
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   52                   | push                edx

        $sequence_9 = { 8b45f8 034510 8945f4 8b4df8 3b4df4 }
            // n = 5, score = 1200
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   034510               | add                 eax, dword ptr [ebp + 0x10]
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   3b4df4               | cmp                 ecx, dword ptr [ebp - 0xc]

    condition:
        7 of them and filesize < 81920
}