rule win_atmosphere_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.atmosphere."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.atmosphere"
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
        $sequence_0 = { 83ec14 56 8b7104 85f6 }
            // n = 4, score = 400
            //   83ec14               | sub                 esp, 0x14
            //   56                   | push                esi
            //   8b7104               | mov                 esi, dword ptr [ecx + 4]
            //   85f6                 | test                esi, esi

        $sequence_1 = { 8bce 8975e8 8806 ff15???????? }
            // n = 4, score = 400
            //   8bce                 | mov                 ecx, esi
            //   8975e8               | mov                 dword ptr [ebp - 0x18], esi
            //   8806                 | mov                 byte ptr [esi], al
            //   ff15????????         |                     

        $sequence_2 = { 57 8b7c240c 8bf1 57 ff15???????? 8b470c 89460c }
            // n = 7, score = 400
            //   57                   | push                edi
            //   8b7c240c             | mov                 edi, dword ptr [esp + 0xc]
            //   8bf1                 | mov                 esi, ecx
            //   57                   | push                edi
            //   ff15????????         |                     
            //   8b470c               | mov                 eax, dword ptr [edi + 0xc]
            //   89460c               | mov                 dword ptr [esi + 0xc], eax

        $sequence_3 = { 8bcf ff5338 5f 5e }
            // n = 4, score = 400
            //   8bcf                 | mov                 ecx, edi
            //   ff5338               | call                dword ptr [ebx + 0x38]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_4 = { 8bce 50 ff15???????? 8d4e16 }
            // n = 4, score = 400
            //   8bce                 | mov                 ecx, esi
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8d4e16               | lea                 ecx, [esi + 0x16]

        $sequence_5 = { 33c0 894612 894616 89461a }
            // n = 4, score = 400
            //   33c0                 | xor                 eax, eax
            //   894612               | mov                 dword ptr [esi + 0x12], eax
            //   894616               | mov                 dword ptr [esi + 0x16], eax
            //   89461a               | mov                 dword ptr [esi + 0x1a], eax

        $sequence_6 = { 56 f6d8 1bc0 57 83e002 }
            // n = 5, score = 400
            //   56                   | push                esi
            //   f6d8                 | neg                 al
            //   1bc0                 | sbb                 eax, eax
            //   57                   | push                edi
            //   83e002               | and                 eax, 2

        $sequence_7 = { 56 57 8d45e0 8965f0 8bf1 }
            // n = 5, score = 400
            //   56                   | push                esi
            //   57                   | push                edi
            //   8d45e0               | lea                 eax, [ebp - 0x20]
            //   8965f0               | mov                 dword ptr [ebp - 0x10], esp
            //   8bf1                 | mov                 esi, ecx

        $sequence_8 = { 83ec10 c645fc02 8bcc 8965e8 50 }
            // n = 5, score = 400
            //   83ec10               | sub                 esp, 0x10
            //   c645fc02             | mov                 byte ptr [ebp - 4], 2
            //   8bcc                 | mov                 ecx, esp
            //   8965e8               | mov                 dword ptr [ebp - 0x18], esp
            //   50                   | push                eax

        $sequence_9 = { 83ec10 c645fc02 8bcc 8965e8 }
            // n = 4, score = 400
            //   83ec10               | sub                 esp, 0x10
            //   c645fc02             | mov                 byte ptr [ebp - 4], 2
            //   8bcc                 | mov                 ecx, esp
            //   8965e8               | mov                 dword ptr [ebp - 0x18], esp

    condition:
        7 of them and filesize < 360448
}