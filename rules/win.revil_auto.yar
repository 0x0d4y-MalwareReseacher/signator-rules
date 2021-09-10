rule win_revil_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.revil."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.revil"
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
        $sequence_0 = { 837d0800 7512 8d85d4fdffff 50 56 ff15???????? 85c0 }
            // n = 7, score = 4200
            //   837d0800             | cmp                 dword ptr [ebp + 8], 0
            //   7512                 | jne                 0x14
            //   8d85d4fdffff         | lea                 eax, dword ptr [ebp - 0x22c]
            //   50                   | push                eax
            //   56                   | push                esi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_1 = { 7205 83f8ff 7737 8bf1 2bf0 1bfa }
            // n = 6, score = 4200
            //   7205                 | jb                  7
            //   83f8ff               | cmp                 eax, -1
            //   7737                 | ja                  0x39
            //   8bf1                 | mov                 esi, ecx
            //   2bf0                 | sub                 esi, eax
            //   1bfa                 | sbb                 edi, edx

        $sequence_2 = { 3bfe 73c7 8a451c 30843d34ffffff }
            // n = 4, score = 4200
            //   3bfe                 | cmp                 edi, esi
            //   73c7                 | jae                 0xffffffc9
            //   8a451c               | mov                 al, byte ptr [ebp + 0x1c]
            //   30843d34ffffff       | xor                 byte ptr [ebp + edi - 0xcc], al

        $sequence_3 = { c3 55 8bec 81ec90010000 8d8510ffffff 56 57 }
            // n = 7, score = 4200
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec90010000         | sub                 esp, 0x190
            //   8d8510ffffff         | lea                 eax, dword ptr [ebp - 0xf0]
            //   56                   | push                esi
            //   57                   | push                edi

        $sequence_4 = { 8b4124 8b5120 03c7 8945f8 }
            // n = 4, score = 4200
            //   8b4124               | mov                 eax, dword ptr [ecx + 0x24]
            //   8b5120               | mov                 edx, dword ptr [ecx + 0x20]
            //   03c7                 | add                 eax, edi
            //   8945f8               | mov                 dword ptr [ebp - 8], eax

        $sequence_5 = { 8a4508 5f 5e 2401 5b 8be5 5d }
            // n = 7, score = 4200
            //   8a4508               | mov                 al, byte ptr [ebp + 8]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   2401                 | and                 al, 1
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp

        $sequence_6 = { 8b809c000000 894b78 8bcb 8945f0 8b45e8 f7d0 23c2 }
            // n = 7, score = 4200
            //   8b809c000000         | mov                 eax, dword ptr [eax + 0x9c]
            //   894b78               | mov                 dword ptr [ebx + 0x78], ecx
            //   8bcb                 | mov                 ecx, ebx
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]
            //   f7d0                 | not                 eax
            //   23c2                 | and                 eax, edx

        $sequence_7 = { 898184000000 8bc7 8b4ddc f7d0 2345f0 f7d1 }
            // n = 6, score = 4200
            //   898184000000         | mov                 dword ptr [ecx + 0x84], eax
            //   8bc7                 | mov                 eax, edi
            //   8b4ddc               | mov                 ecx, dword ptr [ebp - 0x24]
            //   f7d0                 | not                 eax
            //   2345f0               | and                 eax, dword ptr [ebp - 0x10]
            //   f7d1                 | not                 ecx

        $sequence_8 = { 55 8bec 8b4508 8b4008 a3???????? 33c0 40 }
            // n = 7, score = 4200
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b4008               | mov                 eax, dword ptr [eax + 8]
            //   a3????????           |                     
            //   33c0                 | xor                 eax, eax
            //   40                   | inc                 eax

        $sequence_9 = { 0f841c010000 8b5d10 8b7d14 85db 7508 }
            // n = 5, score = 4200
            //   0f841c010000         | je                  0x122
            //   8b5d10               | mov                 ebx, dword ptr [ebp + 0x10]
            //   8b7d14               | mov                 edi, dword ptr [ebp + 0x14]
            //   85db                 | test                ebx, ebx
            //   7508                 | jne                 0xa

    condition:
        7 of them and filesize < 155794432
}