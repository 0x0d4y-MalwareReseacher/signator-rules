rule win_radrat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.radrat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.radrat"
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
        $sequence_0 = { e8???????? 83bdb4feffff00 7554 8b85b0feffff 50 ff15???????? 8b4d08 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83bdb4feffff00       | cmp                 dword ptr [ebp - 0x14c], 0
            //   7554                 | jne                 0x56
            //   8b85b0feffff         | mov                 eax, dword ptr [ebp - 0x150]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]

        $sequence_1 = { 8d9550fdffff 52 ff15???????? 83c40c 8d8550fdffff 50 8d8d40fdffff }
            // n = 7, score = 100
            //   8d9550fdffff         | lea                 edx, [ebp - 0x2b0]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   83c40c               | add                 esp, 0xc
            //   8d8550fdffff         | lea                 eax, [ebp - 0x2b0]
            //   50                   | push                eax
            //   8d8d40fdffff         | lea                 ecx, [ebp - 0x2c0]

        $sequence_2 = { e8???????? 8985e07cffff 8d8d00e6ffff 51 e8???????? 83c42c 8985dc7cffff }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8985e07cffff         | mov                 dword ptr [ebp - 0x8320], eax
            //   8d8d00e6ffff         | lea                 ecx, [ebp - 0x1a00]
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c42c               | add                 esp, 0x2c
            //   8985dc7cffff         | mov                 dword ptr [ebp - 0x8324], eax

        $sequence_3 = { 8d8d5cffffff e8???????? c745fc00000000 8b8568fbffff c7805003000000000000 c7805403000000000000 8b8d68fbffff }
            // n = 7, score = 100
            //   8d8d5cffffff         | lea                 ecx, [ebp - 0xa4]
            //   e8????????           |                     
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   8b8568fbffff         | mov                 eax, dword ptr [ebp - 0x498]
            //   c7805003000000000000     | mov    dword ptr [eax + 0x350], 0
            //   c7805403000000000000     | mov    dword ptr [eax + 0x354], 0
            //   8b8d68fbffff         | mov                 ecx, dword ptr [ebp - 0x498]

        $sequence_4 = { e8???????? 8b8d44feffff e8???????? 25ff000000 85c0 7414 8b8d44feffff }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b8d44feffff         | mov                 ecx, dword ptr [ebp - 0x1bc]
            //   e8????????           |                     
            //   25ff000000           | and                 eax, 0xff
            //   85c0                 | test                eax, eax
            //   7414                 | je                  0x16
            //   8b8d44feffff         | mov                 ecx, dword ptr [ebp - 0x1bc]

        $sequence_5 = { c1e608 8b559c 33ff 668bba4c020000 03fe 03f8 03f9 }
            // n = 7, score = 100
            //   c1e608               | shl                 esi, 8
            //   8b559c               | mov                 edx, dword ptr [ebp - 0x64]
            //   33ff                 | xor                 edi, edi
            //   668bba4c020000       | mov                 di, word ptr [edx + 0x24c]
            //   03fe                 | add                 edi, esi
            //   03f8                 | add                 edi, eax
            //   03f9                 | add                 edi, ecx

        $sequence_6 = { 8d8d58ffffff e8???????? c745fcffffffff 8d4d80 e8???????? 8a85148effff e9???????? }
            // n = 7, score = 100
            //   8d8d58ffffff         | lea                 ecx, [ebp - 0xa8]
            //   e8????????           |                     
            //   c745fcffffffff       | mov                 dword ptr [ebp - 4], 0xffffffff
            //   8d4d80               | lea                 ecx, [ebp - 0x80]
            //   e8????????           |                     
            //   8a85148effff         | mov                 al, byte ptr [ebp - 0x71ec]
            //   e9????????           |                     

        $sequence_7 = { 8d8d10fdffff e8???????? c3 8d8de8fcffff e8???????? c3 8d8dc0fcffff }
            // n = 7, score = 100
            //   8d8d10fdffff         | lea                 ecx, [ebp - 0x2f0]
            //   e8????????           |                     
            //   c3                   | ret                 
            //   8d8de8fcffff         | lea                 ecx, [ebp - 0x318]
            //   e8????????           |                     
            //   c3                   | ret                 
            //   8d8dc0fcffff         | lea                 ecx, [ebp - 0x340]

        $sequence_8 = { c645fc01 8d8d58feffff e8???????? c645fc00 8d8d80feffff e8???????? c745fcffffffff }
            // n = 7, score = 100
            //   c645fc01             | mov                 byte ptr [ebp - 4], 1
            //   8d8d58feffff         | lea                 ecx, [ebp - 0x1a8]
            //   e8????????           |                     
            //   c645fc00             | mov                 byte ptr [ebp - 4], 0
            //   8d8d80feffff         | lea                 ecx, [ebp - 0x180]
            //   e8????????           |                     
            //   c745fcffffffff       | mov                 dword ptr [ebp - 4], 0xffffffff

        $sequence_9 = { 8d8d18d7ffff e8???????? c645fc02 8d8df0d6ffff e8???????? c645fc01 8d8d58ffffff }
            // n = 7, score = 100
            //   8d8d18d7ffff         | lea                 ecx, [ebp - 0x28e8]
            //   e8????????           |                     
            //   c645fc02             | mov                 byte ptr [ebp - 4], 2
            //   8d8df0d6ffff         | lea                 ecx, [ebp - 0x2910]
            //   e8????????           |                     
            //   c645fc01             | mov                 byte ptr [ebp - 4], 1
            //   8d8d58ffffff         | lea                 ecx, [ebp - 0xa8]

    condition:
        7 of them and filesize < 2080768
}