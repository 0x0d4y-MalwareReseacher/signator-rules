rule win_rising_sun_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.rising_sun."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rising_sun"
        malpedia_rule_date = "20221007"
        malpedia_hash = "597f9539014e3d0f350c069cd804aa71679486ae"
        malpedia_version = ""
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
        $sequence_0 = { eb05 b83d000000 488b8c2420180000 4833cc e8???????? 488b9c2450180000 4881c430180000 }
            // n = 7, score = 100
            //   eb05                 | dec                 eax
            //   b83d000000           | sar                 edx, 4
            //   488b8c2420180000     | dec                 eax
            //   4833cc               | mov                 eax, edx
            //   e8????????           |                     
            //   488b9c2450180000     | dec                 eax
            //   4881c430180000       | mov                 ecx, dword ptr [esp + 0x58]

        $sequence_1 = { 41b828100000 488bc8 488bf8 e8???????? }
            // n = 4, score = 100
            //   41b828100000         | and                 dword ptr [ecx + 8], 0
            //   488bc8               | dec                 eax
            //   488bf8               | lea                 eax, [0xf646]
            //   e8????????           |                     

        $sequence_2 = { 488b02 488bf9 0fb708 488bda 6683f95d 751b }
            // n = 6, score = 100
            //   488b02               | dec                 eax
            //   488bf9               | lea                 edx, [eax + 1]
            //   0fb708               | mov                 dword ptr [esp + 0x20], ecx
            //   488bda               | dec                 eax
            //   6683f95d             | lea                 ecx, [ebx + 8]
            //   751b                 | mov                 dword ptr [edi + 0x1000], ecx

        $sequence_3 = { c744241cb5b43824 c7442420f8943b04 c7442424d7744ee4 c7442428ec547fc4 c744242c19349aa4 c74424303d14b484 }
            // n = 6, score = 100
            //   c744241cb5b43824     | lea                 ecx, [0x290a6]
            //   c7442420f8943b04     | inc                 esp
            //   c7442424d7744ee4     | mov                 dword ptr [esp + 0x4c], edi
            //   c7442428ec547fc4     | mov                 ecx, esi
            //   c744242c19349aa4     | inc                 ecx
            //   c74424303d14b484     | mov                 esi, ebp

        $sequence_4 = { 488b4710 4863f6 483bf0 720b b957000780 }
            // n = 5, score = 100
            //   488b4710             | dec                 eax
            //   4863f6               | test                ecx, ecx
            //   483bf0               | dec                 esp
            //   720b                 | mov                 dword ptr [esp + 0x30], esp
            //   b957000780           | inc                 esp

        $sequence_5 = { 4883ec20 488bd9 e8???????? 4c8d1d3f830000 4c891b 488bc3 4883c420 }
            // n = 7, score = 100
            //   4883ec20             | mov                 ebx, ecx
            //   488bd9               | dec                 ecx
            //   e8????????           |                     
            //   4c8d1d3f830000       | cmp                 eax, eax
            //   4c891b               | jae                 0x91e
            //   488bc3               | dec                 eax
            //   4883c420             | lea                 ecx, [0x1ad07]

        $sequence_6 = { c7851c010000a57c9df9 c785200100003213c51d c785240100006a11a39d c785280100000e25ed53 c7852c010000764476b4 c785300100006182fc95 c7853401000045987906 }
            // n = 7, score = 100
            //   c7851c010000a57c9df9     | cmp    eax, 0xc
            //   c785200100003213c51d     | je    0x29d
            //   c785240100006a11a39d     | dec    eax
            //   c785280100000e25ed53     | arpl    dx, dx
            //   c7852c010000764476b4     | dec    eax
            //   c785300100006182fc95     | shl    edx, 9
            //   c7853401000045987906     | dec    eax

        $sequence_7 = { 0f8585010000 488bca e8???????? 488d2d78e60000 4c8d2531640100 83f8ff 7435 }
            // n = 7, score = 100
            //   0f8585010000         | dec                 eax
            //   488bca               | mov                 dword ptr [ecx + 0x10], eax
            //   e8????????           |                     
            //   488d2d78e60000       | inc                 esp
            //   4c8d2531640100       | cmp                 dword ptr [ecx], eax
            //   83f8ff               | jbe                 0x1ad5
            //   7435                 | inc                 ecx

        $sequence_8 = { 4533c9 4533c0 33d2 ff15???????? 488bc8 488905???????? 4885c0 }
            // n = 7, score = 100
            //   4533c9               | dec                 eax
            //   4533c0               | cmp                 dword ptr [ebx + 0x18], 8
            //   33d2                 | jb                  0xbf
            //   ff15????????         |                     
            //   488bc8               | dec                 eax
            //   488905????????       |                     
            //   4885c0               | mov                 ecx, dword ptr [ebx]

        $sequence_9 = { ba00040000 e8???????? 488b8c2420040000 4833cc e8???????? 4881c430040000 }
            // n = 6, score = 100
            //   ba00040000           | inc                 ecx
            //   e8????????           |                     
            //   488b8c2420040000     | mov                 ecx, 0x1000000
            //   4833cc               | inc                 esp
            //   e8????????           |                     
            //   4881c430040000       | mov                 eax, dword ptr [ebp + 0xa0]

    condition:
        7 of them and filesize < 409600
}