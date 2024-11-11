rule win_conficker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.conficker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.conficker"
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
        $sequence_0 = { 73f6 8a47ff 240f 3c0c }
            // n = 4, score = 300
            //   73f6                 | jae                 0xfffffff8
            //   8a47ff               | mov                 al, byte ptr [edi - 1]
            //   240f                 | and                 al, 0xf
            //   3c0c                 | cmp                 al, 0xc

        $sequence_1 = { 4a 4a 60 b066 f2ae 61 0f8476ffffff }
            // n = 7, score = 300
            //   4a                   | dec                 edx
            //   4a                   | dec                 edx
            //   60                   | pushal              
            //   b066                 | mov                 al, 0x66
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]
            //   61                   | popal               
            //   0f8476ffffff         | je                  0xffffff7c

        $sequence_2 = { 51 dd5df0 51 df6de8 df6df8 d9e0 }
            // n = 6, score = 300
            //   51                   | push                ecx
            //   dd5df0               | fstp                qword ptr [ebp - 0x10]
            //   51                   | push                ecx
            //   df6de8               | fild                qword ptr [ebp - 0x18]
            //   df6df8               | fild                qword ptr [ebp - 8]
            //   d9e0                 | fchs                

        $sequence_3 = { 8bec 8b4508 33d2 8910 895004 33c9 894c8808 }
            // n = 7, score = 300
            //   8bec                 | mov                 ebp, esp
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   33d2                 | xor                 edx, edx
            //   8910                 | mov                 dword ptr [eax], edx
            //   895004               | mov                 dword ptr [eax + 4], edx
            //   33c9                 | xor                 ecx, ecx
            //   894c8808             | mov                 dword ptr [eax + ecx*4 + 8], ecx

        $sequence_4 = { 8bc1 c1e805 8b0482 83e11f d3e8 a801 }
            // n = 6, score = 300
            //   8bc1                 | mov                 eax, ecx
            //   c1e805               | shr                 eax, 5
            //   8b0482               | mov                 eax, dword ptr [edx + eax*4]
            //   83e11f               | and                 ecx, 0x1f
            //   d3e8                 | shr                 eax, cl
            //   a801                 | test                al, 1

        $sequence_5 = { 83c261 66891473 46 3bf7 7ce8 }
            // n = 5, score = 300
            //   83c261               | add                 edx, 0x61
            //   66891473             | mov                 word ptr [ebx + esi*2], dx
            //   46                   | inc                 esi
            //   3bf7                 | cmp                 esi, edi
            //   7ce8                 | jl                  0xffffffea

        $sequence_6 = { e8???????? dc45e0 59 59 5f dd1d???????? }
            // n = 6, score = 300
            //   e8????????           |                     
            //   dc45e0               | fadd                qword ptr [ebp - 0x20]
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   5f                   | pop                 edi
            //   dd1d????????         |                     

        $sequence_7 = { 61 c3 ac 88c4 c0e807 7212 7414 }
            // n = 7, score = 300
            //   61                   | popal               
            //   c3                   | ret                 
            //   ac                   | lodsb               al, byte ptr [esi]
            //   88c4                 | mov                 ah, al
            //   c0e807               | shr                 al, 7
            //   7212                 | jb                  0x14
            //   7414                 | je                  0x16

        $sequence_8 = { 8a27 47 c0ec04 28e0 73f6 }
            // n = 5, score = 300
            //   8a27                 | mov                 ah, byte ptr [edi]
            //   47                   | inc                 edi
            //   c0ec04               | shr                 ah, 4
            //   28e0                 | sub                 al, ah
            //   73f6                 | jae                 0xfffffff8

        $sequence_9 = { 8954241c 61 c3 ac }
            // n = 4, score = 300
            //   8954241c             | mov                 dword ptr [esp + 0x1c], edx
            //   61                   | popal               
            //   c3                   | ret                 
            //   ac                   | lodsb               al, byte ptr [esi]

    condition:
        7 of them and filesize < 335872
}