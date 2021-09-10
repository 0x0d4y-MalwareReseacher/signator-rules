rule win_client_maximus_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.client_maximus."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.client_maximus"
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
        $sequence_0 = { 89f0 0fb6c0 0fb61403 88140b }
            // n = 4, score = 300
            //   89f0                 | mov                 eax, esi
            //   0fb6c0               | movzx               eax, al
            //   0fb61403             | movzx               edx, byte ptr [ebx + eax]
            //   88140b               | mov                 byte ptr [ebx + ecx], dl

        $sequence_1 = { 53 83ec10 8b1d???????? c70424???????? ffd3 89c6 }
            // n = 6, score = 300
            //   53                   | push                ebx
            //   83ec10               | sub                 esp, 0x10
            //   8b1d????????         |                     
            //   c70424????????       |                     
            //   ffd3                 | call                ebx
            //   89c6                 | mov                 esi, eax

        $sequence_2 = { 0fb63c0b 99 f77c241c 89f8 02441500 01c6 }
            // n = 6, score = 300
            //   0fb63c0b             | movzx               edi, byte ptr [ebx + ecx]
            //   99                   | cdq                 
            //   f77c241c             | idiv                dword ptr [esp + 0x1c]
            //   89f8                 | mov                 eax, edi
            //   02441500             | add                 al, byte ptr [ebp + edx]
            //   01c6                 | add                 esi, eax

        $sequence_3 = { 83ec04 a3???????? c7442404???????? 893424 ff15???????? 83ec08 85c0 }
            // n = 7, score = 300
            //   83ec04               | sub                 esp, 4
            //   a3????????           |                     
            //   c7442404????????     |                     
            //   893424               | mov                 dword ptr [esp], esi
            //   ff15????????         |                     
            //   83ec08               | sub                 esp, 8
            //   85c0                 | test                eax, eax

        $sequence_4 = { 8b542408 8b442404 85d2 8b4004 7403 0302 }
            // n = 6, score = 300
            //   8b542408             | mov                 edx, dword ptr [esp + 8]
            //   8b442404             | mov                 eax, dword ptr [esp + 4]
            //   85d2                 | test                edx, edx
            //   8b4004               | mov                 eax, dword ptr [eax + 4]
            //   7403                 | je                  5
            //   0302                 | add                 eax, dword ptr [edx]

        $sequence_5 = { 55 89e5 56 53 83ec10 8b1d???????? c70424???????? }
            // n = 7, score = 300
            //   55                   | push                ebp
            //   89e5                 | mov                 ebp, esp
            //   56                   | push                esi
            //   53                   | push                ebx
            //   83ec10               | sub                 esp, 0x10
            //   8b1d????????         |                     
            //   c70424????????       |                     

        $sequence_6 = { 7fe1 891424 e8???????? 8b4304 85c0 }
            // n = 5, score = 300
            //   7fe1                 | jg                  0xffffffe3
            //   891424               | mov                 dword ptr [esp], edx
            //   e8????????           |                     
            //   8b4304               | mov                 eax, dword ptr [ebx + 4]
            //   85c0                 | test                eax, eax

        $sequence_7 = { 7409 c70424???????? ffd2 8d65f8 5b 5e }
            // n = 6, score = 300
            //   7409                 | je                  0xb
            //   c70424????????       |                     
            //   ffd2                 | call                edx
            //   8d65f8               | lea                 esp, dword ptr [ebp - 8]
            //   5b                   | pop                 ebx
            //   5e                   | pop                 esi

        $sequence_8 = { 90 89c8 0fb63c0b 99 f77c241c 89f8 02441500 }
            // n = 7, score = 300
            //   90                   | nop                 
            //   89c8                 | mov                 eax, ecx
            //   0fb63c0b             | movzx               edi, byte ptr [ebx + ecx]
            //   99                   | cdq                 
            //   f77c241c             | idiv                dword ptr [esp + 0x1c]
            //   89f8                 | mov                 eax, edi
            //   02441500             | add                 al, byte ptr [ebp + edx]

        $sequence_9 = { 8954240c ff5320 ff15???????? 895c2408 c744240400000000 890424 ff15???????? }
            // n = 7, score = 300
            //   8954240c             | mov                 dword ptr [esp + 0xc], edx
            //   ff5320               | call                dword ptr [ebx + 0x20]
            //   ff15????????         |                     
            //   895c2408             | mov                 dword ptr [esp + 8], ebx
            //   c744240400000000     | mov                 dword ptr [esp + 4], 0
            //   890424               | mov                 dword ptr [esp], eax
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 106496
}