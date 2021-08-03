# Copyright (C) 2021 The Proton AOSP Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Key migration

# AOSP test keys (build/make/target/product/security)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
	ro.build.certs.test.media=308204a830820390a003020102020900f2b98e6123572c4e300d06092a864886f70d0101040500308194310b3009060355040613025553311330110603550408130a43616c69666f726e6961311630140603550407130d4d6f756e7461696e20566965773110300e060355040a1307416e64726f69643110300e060355040b1307416e64726f69643110300e06035504031307416e64726f69643122302006092a864886f70d0109011613616e64726f696440616e64726f69642e636f6d301e170d3038303431353233343035375a170d3335303930313233343035375a308194310b3009060355040613025553311330110603550408130a43616c69666f726e6961311630140603550407130d4d6f756e7461696e20566965773110300e060355040a1307416e64726f69643110300e060355040b1307416e64726f69643110300e06035504031307416e64726f69643122302006092a864886f70d0109011613616e64726f696440616e64726f69642e636f6d30820120300d06092a864886f70d01010105000382010d00308201080282010100ae250c5a16ef97fc2869ac651b3217cc36ba0e86964168d58a049f40ce85867123a3ffb4f6d949c33cf2da3a05c23eacaa57d803889b1759bcf59e7c6f21890ae25085b7ed56aa626c0989ef9ccd36362ca0e8d1b9603fd4d8328767926ccc090c68b775ae7ff30934cc369ef2855a2667df0c667fd0c7cf5d8eba655806737303bb624726eabaedfb72f07ed7a76ab3cb9a381c4b7dcd809b140d891f00213be401f58d6a06a61eadc3a9c2f1c6567285b09ae09342a66fa421eaf93adf7573a028c331d70601ab3af7cc84033ece7c772a3a5b86b0dbe9d777c3a48aa9801edcee2781589f44d9e4113979600576a99410ba81091259dad98c6c68ff784b8f020103a381fc3081f9301d0603551d0e04160414ca293caa8bc0ed3e542eef4205a2bff2b57e4d753081c90603551d230481c13081be8014ca293caa8bc0ed3e542eef4205a2bff2b57e4d75a1819aa48197308194310b3009060355040613025553311330110603550408130a43616c69666f726e6961311630140603550407130d4d6f756e7461696e20566965773110300e060355040a1307416e64726f69643110300e060355040b1307416e64726f69643110300e06035504031307416e64726f69643122302006092a864886f70d0109011613616e64726f696440616e64726f69642e636f6d820900f2b98e6123572c4e300c0603551d13040530030101ff300d06092a864886f70d0101040500038201010084de9516d5e4a87217a73da8487048f53373a5f733f390d61bdf3cc9e5251625bfcaa7c3159cae275d172a9ae1e876d5458127ac542f68290dd510c0029d8f51e0ee156b7b7b5acdb394241b8ec78b74e5c42c5cafae156caf5bd199a23a27524da072debbe378464a533630b0e4d0ffb7e08ecb701fadb6379c74467f6e00c6ed888595380792038756007872c8e3007af423a57a2cab3a282869b64c4b7bd5fc187d0a7e2415965d5aae4e07a6df751b4a75e9793c918a612b81cd0b628aee0168dc44e47b10d3593260849d6adf6d727dc24444c221d3f9ecc368cad07999f2b8105bc1f20d38d41066cc1411c257a96ea4349f5746565507e4e8020a1a81 \
	ro.build.certs.test.networkstack=308205dc308203c4a003020102020900fc6cb0d8a6fdd168300d06092a864886f70d01010b0500308181310b30090603550406130255533113301106035504080c0a43616c69666f726e69613116301406035504070c0d4d6f756e7461696e20566965773110300e060355040a0c07416e64726f69643110300e060355040b0c07416e64726f69643121301f06035504030c18636f6d2e616e64726f69642e6e6574776f726b737461636b3020170d3139303231323031343632305a180f34373537303130383031343632305a308181310b30090603550406130255533113301106035504080c0a43616c69666f726e69613116301406035504070c0d4d6f756e7461696e20566965773110300e060355040a0c07416e64726f69643110300e060355040b0c07416e64726f69643121301f06035504030c18636f6d2e616e64726f69642e6e6574776f726b737461636b30820222300d06092a864886f70d01010105000382020f003082020a0282020100bb71f5137ff0b2d757acc2ca3d378e0f8de11090d5caf3d49e314d35c283b778b02d792d8eba440364ca970985441660f0bc00afbc63dd611b1bf51ad28a1edd21e0048f548b80f8bd113e25682822f57dab8273afaf12c64d19a0c6be238f3e66ddc79b10fd926931e3ee60a7bf618644da3c2c4fc428139d45d27beda7fe45e30075b493ead6ec01cdd55d931c0a657e2e59742ca632b6dc3842a2deb7d22443c809291d7a549203ae6ae356582a4ca23f30f0549c4ec8408a75278e95c69e8390ad5280bcefaef6f1309a41bd9f3bfb5d12dca7e79ec6fd6848193fa9ab728224887b4f93e985ec7cbf6401b0e863a4b91c05d046f040fe954004b1645954fcb4114cee1e8b64b47d719a19ef4c001cb183f7f3e166e43f56d68047c3440da34fdf529d44274b8b2f6afb345091ad8ad4b93bd5c55d52286a5d3c157465db8ddf62e7cdb6b10fb18888046afdd263ae6f2125d9065759c7e42f8610a6746edbdc547d4301612eeec3c3cbd124dececc8d38b20e73b13f24ee7ca13a98c5f61f0c81b07d2b519749bc2bcb9e0949aef6c118a3e8125e6ab57fce46bb091a66740e10b31c740b891900c0ecda9cc69ecb4f3369998b175106dd0a4ffd7024eb7e75fedd1a5b131d0bb2b40c63491e3cf86b8957b21521b3a96ed1376a51a6ac697866b0256dee1bcd9ab9a188bf4ced80b59a5f24c2da9a55eb7b0e502116e30203010001a3533051301d0603551d0e041604149383c92cfbf099d5c47b0c3657d8622a084b72e1301f0603551d230418301680149383c92cfbf099d5c47b0c3657d8622a084b72e1300f0603551d130101ff040530030101ff300d06092a864886f70d01010b050003820201006a0501382fde2a6b8f70c60cd1b8ee4f788718c288b170258ef3a96230b65005650d6a4c42a59a97b2ddec502413e7b438fbd060363d74b74a232382a7f77fd3da34e38f79fad035a8b472c5cff365818a0118d87fa1e31cc7ed4befd27628760c290980c3cc3b7ff0cfd01b75ff1fcc83e981b5b25a54d85b68a80424ac26015fb3a4c754969a71174c0bc283f6c88191dced609e245f5938ffd0ad799198e2d0bf6342221c1b0a5d332ed2fffc668982cabbcb7d3b630ff8476e5c84ac0ad37adf9224035200039f95ec1fa95bf83796c0e8986135cee2dcaef190b249855a7e7397d4a0bf17ea63d978589c6b48118a381fffbd790c44d80233e2e35292a3b5533ca3f2cc173f85cf904adfe2e4e2183dc1eba0ebae07b839a81ff1bc92e292550957c8599af21e9c0497b9234ce345f3f508b1cc872aa55ddb5e773c5c7dd6577b9a8b6daed20ae1ff4b8206fd9f5c8f5a22ba1980bef01ae6fcb2659b97ad5b985fa81c019ffe008ddd9c8130c06fc6032b2149c2209fc438a7e8c3b20ce03650ad31c4ee48f169777a0ae182b72ca31b81540f61f167d8d7adf4f6bb2330ff5c24037245000d8172c12ab5d5aa5890b8b12db0f0e7296264eb66e7f9714c31004649fb4b864005f9c43c80db3f6de52fd44d6e2036bfe7f5807156ed5ab591d06fd6bb93ba4334ea2739af8b41ed2686454e60b666d10738bb7ba88001 \
	ro.build.certs.test.platform=308204a830820390a003020102020900b3998086d056cffa300d06092a864886f70d0101040500308194310b3009060355040613025553311330110603550408130a43616c69666f726e6961311630140603550407130d4d6f756e7461696e20566965773110300e060355040a1307416e64726f69643110300e060355040b1307416e64726f69643110300e06035504031307416e64726f69643122302006092a864886f70d0109011613616e64726f696440616e64726f69642e636f6d301e170d3038303431353232343035305a170d3335303930313232343035305a308194310b3009060355040613025553311330110603550408130a43616c69666f726e6961311630140603550407130d4d6f756e7461696e20566965773110300e060355040a1307416e64726f69643110300e060355040b1307416e64726f69643110300e06035504031307416e64726f69643122302006092a864886f70d0109011613616e64726f696440616e64726f69642e636f6d30820120300d06092a864886f70d01010105000382010d003082010802820101009c780592ac0d5d381cdeaa65ecc8a6006e36480c6d7207b12011be50863aabe2b55d009adf7146d6f2202280c7cd4d7bdb26243b8a806c26b34b137523a49268224904dc01493e7c0acf1a05c874f69b037b60309d9074d24280e16bad2a8734361951eaf72a482d09b204b1875e12ac98c1aa773d6800b9eafde56d58bed8e8da16f9a360099c37a834a6dfedb7b6b44a049e07a269fccf2c5496f2cf36d64df90a3b8d8f34a3baab4cf53371ab27719b3ba58754ad0c53fc14e1db45d51e234fbbe93c9ba4edf9ce54261350ec535607bf69a2ff4aa07db5f7ea200d09a6c1b49e21402f89ed1190893aab5a9180f152e82f85a45753cf5fc19071c5eec827020103a381fc3081f9301d0603551d0e041604144fe4a0b3dd9cba29f71d7287c4e7c38f2086c2993081c90603551d230481c13081be80144fe4a0b3dd9cba29f71d7287c4e7c38f2086c299a1819aa48197308194310b3009060355040613025553311330110603550408130a43616c69666f726e6961311630140603550407130d4d6f756e7461696e20566965773110300e060355040a1307416e64726f69643110300e060355040b1307416e64726f69643110300e06035504031307416e64726f69643122302006092a864886f70d0109011613616e64726f696440616e64726f69642e636f6d820900b3998086d056cffa300c0603551d13040530030101ff300d06092a864886f70d01010405000382010100572551b8d93a1f73de0f6d469f86dad6701400293c88a0cd7cd778b73dafcc197fab76e6212e56c1c761cfc42fd733de52c50ae08814cefc0a3b5a1a4346054d829f1d82b42b2048bf88b5d14929ef85f60edd12d72d55657e22e3e85d04c831d613d19938bb8982247fa321256ba12d1d6a8f92ea1db1c373317ba0c037f0d1aff645aef224979fba6e7a14bc025c71b98138cef3ddfc059617cf24845cf7b40d6382f7275ed738495ab6e5931b9421765c491b72fb68e080dbdb58c2029d347c8b328ce43ef6a8b15533edfbe989bd6a48dd4b202eda94c6ab8dd5b8399203daae2ed446232e4fe9bd961394c6300e5138e3cfd285e6e4e483538cb8b1b357 \
	ro.build.certs.test.shared=308204a830820390a003020102020900f2a73396bd38767a300d06092a864886f70d0101040500308194310b3009060355040613025553311330110603550408130a43616c69666f726e6961311630140603550407130d4d6f756e7461696e20566965773110300e060355040a1307416e64726f69643110300e060355040b1307416e64726f69643110300e06035504031307416e64726f69643122302006092a864886f70d0109011613616e64726f696440616e64726f69642e636f6d301e170d3038303732333231353735395a170d3335313230393231353735395a308194310b3009060355040613025553311330110603550408130a43616c69666f726e6961311630140603550407130d4d6f756e7461696e20566965773110300e060355040a1307416e64726f69643110300e060355040b1307416e64726f69643110300e06035504031307416e64726f69643122302006092a864886f70d0109011613616e64726f696440616e64726f69642e636f6d30820120300d06092a864886f70d01010105000382010d00308201080282010100c8c2dbfd094a2df45c3ff1a32ed21805ec72fc58d017971bd0f6b52c262d70819d191967e158dfd3a2c7f1b3e0e80ce545d79d2848220211eb86f0fd8312d37b420c113750cc94618ae872f4886463bdc4627caa0c0483c86493e3515571170338bfdcc4cd6addd1c0a2f35f5cf24ed3e4043a3e58e2b05e664ccde12bcb67735fd6df1249c369e62542bc0a4729e53917f5c38ffa52d17b73c9c73798ddb18ed481590875547e66bfc5daca4c25a6eb960ed96923709da302ba646cb496b325e86c5c8b2e7a3377b2bbe4c7cf33254291163f689152ac088550c83c508f4bf5adf0aed5a2dca0583f9ab0ad17650db7eea4b23fdb45885547d0feab72183889020103a381fc3081f9301d0603551d0e04160414cb4c7e2cdbb3f0ada98dab79968d172e9dbb1ed13081c90603551d230481c13081be8014cb4c7e2cdbb3f0ada98dab79968d172e9dbb1ed1a1819aa48197308194310b3009060355040613025553311330110603550408130a43616c69666f726e6961311630140603550407130d4d6f756e7461696e20566965773110300e060355040a1307416e64726f69643110300e060355040b1307416e64726f69643110300e06035504031307416e64726f69643122302006092a864886f70d0109011613616e64726f696440616e64726f69642e636f6d820900f2a73396bd38767a300c0603551d13040530030101ff300d06092a864886f70d0101040500038201010040a8d096997959e917a36c44246b6bac2bae05437ecd89794118f7834720352d1c6f8a39b0869942f4da65981faa2951d33971129ec1921d795671c527d6e249f252829faf5b591310311e2de096500d568ad4114a656dc34a8c6f610453afc1ea7992dba4aa7b3f8543a6e35c0728de77fe97eeac83771fd0ec90f8e4449434ee0b6045783e70c7a2e460249260e003cf7608dc352a4c9ef706def4b26050e978ae2fffd7a3323787014915eb3cc874fcc7a9ae930877c5c8c7d1c2e2a8ee863c89180d1855cedba400e7ba43cccaa7243d397e7c0e8e8e4d7d4f92b6bbead49c0cf018069eddca2e7e2fb4668d89dbbd7950d0cd254180fa1eaafc2a556f84 \
	ro.build.certs.test.bluetooth=3082063b30820423a003020102021412265aa5a599552b5eaf4e8224c7f69078bc3c8b300d06092a864886f70d01010b05003081ab310b30090603550406130255533113301106035504080c0a43616c69666f726e69613116301406035504070c0d4d6f756e7461696e20566965773110300e060355040a0c07416e64726f69643110300e060355040b0c07416e64726f69643127302506035504030c1e636f6d2e616e64726f69642e626c7565746f6f74682e73657276696365733122302006092a864886f70d0109011613616e64726f696440616e64726f69642e636f6d3020170d3232303331353030333630335a180f34373630303230393030333630335a3081ab310b30090603550406130255533113301106035504080c0a43616c69666f726e69613116301406035504070c0d4d6f756e7461696e20566965773110300e060355040a0c07416e64726f69643110300e060355040b0c07416e64726f69643127302506035504030c1e636f6d2e616e64726f69642e626c7565746f6f74682e73657276696365733122302006092a864886f70d0109011613616e64726f696440616e64726f69642e636f6d30820222300d06092a864886f70d01010105000382020f003082020a0282020100b1596af69a3351110695bf2ef18d007d8c0fb393ae6af371fc4b17d376938e601751f48e3007b0ab35170c8463c3c510bce5badeeb5a674828f68b033f335f5447ed986c56fc0502f8758668b0d07c260eddf89c3cf392ef1a4484664444d6e786f879a97d0d06dea627282c7e93a644f4e16e2e8883606bc61d5ea9562a4644e384d14a0fa8027753dd32651217cf311186995af4e4113f3d661dfc94bcdadb1ff07cd666092015bab370d4a7fd3507d8b1a187c0cb23aef4f2846f774d3617cd1045cc03b65a5062c3a474b50afc656e5708cf58a3a012d0a5e2534656c0e5f184676bdfcacd77b8fd9d9b691705a637592079bfefa447ead1896e6bd072b944677c966ed8ae136c56a6bb28e2848b6b6b664a3ad14d3c37ae82028c0a4b99cfa594f050a8304a67ab93f66a0c4d38601aef29d774dcde93df0ddd3197f2ab5f1200afeafcae33481a909e83f67338de7b029b52e407f240d0269c5b247396368b2f50b84b8ddacc4398c8e39bf782139e4642406b47df7931cda9b23cb219dfb545e3ebfac935f248b0733a785e3ace6e0480e885526e23cdfc6cb8597fc7b9988ae78e22b0b261315e242f82275bc2f64a0b3f67f184f88948563f1e055be18f722bd9b2fb0409c9c9d905112b5ce18abe50b8b4bb65b02d878922114c49eae8c5e637ed13e2ff0a52b62e2634d885d644272df09d617c9659c7c966dcf50203010001a3533051301d0603551d0e04160414ee4282d43329b4c477f43daf12b5e1af41070159301f0603551d23041830168014ee4282d43329b4c477f43daf12b5e1af41070159300f0603551d130101ff040530030101ff300d06092a864886f70d01010b050003820201006ac64b5ce66a801156aeea86863ec7349cd48fd3cdfeaf1ba687042f82708a12336a2aafa4c61fe0031c063a8e1bbfab3bf58a3de0b6822702406d916bd8b0221578848f8fc42899c77c108796efba7e02b2b34b81d8e66d5cfcee03ff9ae497a7347b116ae0f770f55f31c8cf7c42d2dda23e31cf35d44cf388c2444e1e48fca2d70c2f6f26fcc0b497fe1bf9f9479cfa8a16e2c18e1c62f5bfd97f06977e39314dc5e93379cf1fcccdee4689a52d5f3d6d48272c4962f4f4db6b8af9a7e97b34e6c92ff9d1a3a77141a30c9470f0270e07cf0ef25a62cc30f7b43ecfea354ea514494b84a791512b6c89f5c5d58447ab9b8679f2707ed4983548c7ebcd77fb7a6036b7efb6aef196be2e76c33df575f8e83e45a2521088c981f632aa78c1c4675118ddb555ba89751ce8fde3b864577698656d328b15af48f0e0ef2beb4a3da0c3160536c5a71388f76f5075c57e5f52f3f00f01673d1f6977d9d99f6eb1cb6e5b616d6607b7b6c274ef3ee4ba135d6e79b6c9055f77416a889b1aa548e586071d155a0358fbaa39f580a06df56e57ba7a2367c5f8e209c90f5b2722204ea5c3dee7bdabc68e551a707e6a546f3a84e594ef1c8181e4343c7e1ef8dc6be74c9403418cc678b581e7d9146f2a10f74d46e0d3d5076a0c687ff046b5d46114317740c64d14ceac80b4b0ebe8c6f02ba9559aa99eb9e15da20763bd0de65def78 \
	ro.build.certs.test.sdk_sandbox=3082040b308202f3a0030201020214316246427ac953bcc11293eabfadeed873a589bd300d06092a864886f70d01010b0500308194310b30090603550406130255533113301106035504080c0a43616c69666f726e69613116301406035504070c0d4d6f756e7461696e20566965773110300e060355040a0c07416e64726f69643110300e060355040b0c07416e64726f69643110300e06035504030c07416e64726f69643122302006092a864886f70d0109011613616e64726f696440616e64726f69642e636f6d301e170d3231313130323137303231345a170d3439303332303137303231345a308194310b30090603550406130255533113301106035504080c0a43616c69666f726e69613116301406035504070c0d4d6f756e7461696e20566965773110300e060355040a0c07416e64726f69643110300e060355040b0c07416e64726f69643110300e06035504030c07416e64726f69643122302006092a864886f70d0109011613616e64726f696440616e64726f69642e636f6d30820122300d06092a864886f70d01010105000382010f003082010a0282010100d3d8f77724f1bfca236f8b178eb597b265d36047b3feee97ea9a3cfa6597a75c65d58f718d8af16513881353092fc69acbc89826286ac7b4415933c962d6194cb12503777242e3200c82ad950477400311a1cd882ab91f7086e812cef5c65efc1274d241f4494d4105bcd8a0ce37c17b7255b4d0c2f4147fdf722ff683440fce2a5bd0b9e21e135872f2be8ef9ba7ccf414192eae1088611daffcca765941660477437001036a6dc31d6cdf019fab1144289d10e20f77c52ef03b48a1f2e2eff60ca38087d50e5fe5441bb4fb6a5369bc7e340df5663331acef5a5b5113e1d80c7f589d708b02c56270d7661610255eb8b5e671b60224674ab1eefe96a701ceb0203010001a3533051301d0603551d0e04160414dc5e6bd838496d17e424abaab358633ffd1d0941301f0603551d23041830168014dc5e6bd838496d17e424abaab358633ffd1d0941300f0603551d130101ff040530030101ff300d06092a864886f70d01010b05000382010100c1043cfc3ddffd64b9730a9cb05a53f90ce293dc93bb9de7b17cffa410d26de337cd7d5109e8d7b265e13e337b72ed2e25896b22e02b39a807482e690dc8ba1b3730ba79e79116b3480993a472d246079b70b80a1cb0a987db2e948d6bf36c7dba9178ef32e56df913aed189af27a3fb2589d8d7bc8ab2483de351d33d2c4c1589d8d820e797b31568f79a2873c3867a614f6dc4907b1a3f5e3585dd72e6e3a0db3699253fe9d47e1f026d0fae05b87df140b18c66c722cc237c37a6f9c5aca3c0fb2ccd085a1c8e22478a0627da6b6c3774268ca5c16af62eb42162e5900a7db4706e5886bb59b218fa7f57865754c361df31ce26a98a5ab0ceb721011bcff2

# Official PixelBuilds release keys
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
	ro.build.certs.release.media=3082041930820301a00302010202146d76e2e73b01277567c3bf93eddaa6424724dcf6300d06092a864886f70d01010b050030819a310b3009060355040613024d54310e300c06035504080c054d616c7461310e300c06035504070c054d616c746131143012060355040a0c0b506978656c4275696c647331143012060355040b0c0b506978656c4275696c64733117301506035504030c0e506978656c4275696c6473526f6d3126302406092a864886f70d0109011617626f6f74696e67706978656c7340676d61696c2e636f6d3020170d3233313130353135323634345a180f32303531303332333135323634345a30819a310b3009060355040613024d54310e300c06035504080c054d616c7461310e300c06035504070c054d616c746131143012060355040a0c0b506978656c4275696c647331143012060355040b0c0b506978656c4275696c64733117301506035504030c0e506978656c4275696c6473526f6d3126302406092a864886f70d0109011617626f6f74696e67706978656c7340676d61696c2e636f6d30820122300d06092a864886f70d01010105000382010f003082010a0282010100d9b98d40fae9ec36c050294f035082eecb5078a33695f229a7df6c5ecebe9f35b53e845573461f018957d200b30a5b8e725039ffdfd42cf71a08baa7dd43f2ca0e371c1a5ae270654c56ea134519384b1eaf7e86728e18f1b25f558659e7400efc37b6019c3eacf06101814af9e1a6c604e15188fd36dfe6966a022a748a35175c1604f823e8fb0b0c43b48906d8a50b9d215445dfde2d3c4da21e8b5e6e5715e1a2458da47994ca3930cf9dce2b1f3c4e4760b42f924479e537d26b1c7536fdec7fec5c76f2c4f51dec5397a5b649da751600160b3375360068915a3fe2ee4eb63264f3319fc7f8e9f507e2938b1af9ee64d783cc3e70eb79c975271000f35d0203010001a3533051301d0603551d0e04160414ba422fecca95044e1f01f9cad6a0c68b0d5023e9301f0603551d23041830168014ba422fecca95044e1f01f9cad6a0c68b0d5023e9300f0603551d130101ff040530030101ff300d06092a864886f70d01010b050003820101003cb23f2ca0b14d3cabedf79a4ab99bcd3687be658eda5b5c71c63ac4da31d513a76581e2bef376e0cb91e4e109795e6a7fd40a2f4a742066e30d7f4b029165560ada7121767d6691c7c3dbf3dc564f1d92cafaf2712cdd072dcce805d5893ea54dd589586811d9860047ea83465ab114bca5b1567a45e6890dae7912dc19ef8f7d352374616de6ac11717a8bb469138621aef3378260a304705aa70de1e17463752aaefea04a72d7a5390b5b6aef2ddb56c5a2775d25eb03a9e6696654a55c3547833b5b667c210f894032d32b420184b35a1bf63631272d6057be5c09472f50195eb7faef2a5e042ab2927e57dd49acafa1db4b7f77f94170d4827d7b2584bc \
	ro.build.certs.release.networkstack=3082041930820301a003020102021441b8cc2ae312e8eb9fa26a8b5a5d2aef29186e30300d06092a864886f70d01010b050030819a310b3009060355040613024d54310e300c06035504080c054d616c7461310e300c06035504070c054d616c746131143012060355040a0c0b506978656c4275696c647331143012060355040b0c0b506978656c4275696c64733117301506035504030c0e506978656c4275696c6473526f6d3126302406092a864886f70d0109011617626f6f74696e67706978656c7340676d61696c2e636f6d3020170d3233313130353135323634345a180f32303531303332333135323634345a30819a310b3009060355040613024d54310e300c06035504080c054d616c7461310e300c06035504070c054d616c746131143012060355040a0c0b506978656c4275696c647331143012060355040b0c0b506978656c4275696c64733117301506035504030c0e506978656c4275696c6473526f6d3126302406092a864886f70d0109011617626f6f74696e67706978656c7340676d61696c2e636f6d30820122300d06092a864886f70d01010105000382010f003082010a0282010100d062645a3e5b6944c7cbaedefc1e1a12dcbda74b99b7765b57622e76cb21a930f1956613c3d9832b92adaee155d09779654a8576d48bf53b7fc0f98b7eeb81d950d7f9b91ba3cc96be4f1f69ea3e10b86a97fe43cb7ed2d75d622addf15bf42de8e9721200d42fc8d62a6cb694403957975dc0d442e18f28483c2029eb6160b75a775f918decc61f24afd4f4630f2472373484fcd7ab02fc2cd10ddecbd081b6c02280f01947b4fc22154a1cacbe5ea070853e132ad8d0ddcd1c9eff8b6d24747cc089ad51c041e600bacdfe67153034cdc9ff39845d5306e404cdfc24287a6c2d8432be64e179af1e0f7170cf04b60cafcc0cb9b6f52fce0f1075d57c02ed3b0203010001a3533051301d0603551d0e041604144b6f5ea58b215175bdf82142163d4a35677f06ef301f0603551d230418301680144b6f5ea58b215175bdf82142163d4a35677f06ef300f0603551d130101ff040530030101ff300d06092a864886f70d01010b05000382010100005f5342648213867f7cadc3794b80b1a6f346df4b8205245ef11187c5ef550ffb4ad712ea76c6a42c646254695d09a83151cae3c798460af04cc07b8dc9619fcbd03a5acde445fe0bf9e47074d787e1113b8cf7243289d025e7c2cbafe0f9ec7c13c1006456e630cae39ce0ed42b4550991f0bd00781375a8d4e64620230b49630c5c5970b38cd8f1121d79be065779029122e863612c0366ec577628c57a857ad8c89a2ad5a48ce3159f22196df224f3daefc1e4366b6dbfbecf599183657284305c9eea02be9a0048faed3edf6aec7c28f6ec75761363af339fade07945216c23330b14b1997fe44bc814b351114c8bc91033b42587f8610daebd252d0639 \
	ro.build.certs.release.platform=3082041930820301a003020102021456f2a34d3fcc1b567e0f42f1c47d3a0e402b5db4300d06092a864886f70d01010b050030819a310b3009060355040613024d54310e300c06035504080c054d616c7461310e300c06035504070c054d616c746131143012060355040a0c0b506978656c4275696c647331143012060355040b0c0b506978656c4275696c64733117301506035504030c0e506978656c4275696c6473526f6d3126302406092a864886f70d0109011617626f6f74696e67706978656c7340676d61696c2e636f6d3020170d3233313130353135323634355a180f32303531303332333135323634355a30819a310b3009060355040613024d54310e300c06035504080c054d616c7461310e300c06035504070c054d616c746131143012060355040a0c0b506978656c4275696c647331143012060355040b0c0b506978656c4275696c64733117301506035504030c0e506978656c4275696c6473526f6d3126302406092a864886f70d0109011617626f6f74696e67706978656c7340676d61696c2e636f6d30820122300d06092a864886f70d01010105000382010f003082010a0282010100e7b55cbe7fd6eb2dc7633432c1b93eb8e5ebc6955190de5ef49e295c036e677cac8bc59443416efd2c2578f11332e793a1677505ec81690ea377cde8a94288c19b18af998451475c86eaba283087f6184f1defa98408f1301ce5cc546e143c774e31549a91fd2a3958ef5428dc4005b9b9704ffc420b2f307b87a8e9bd4544204d524a49697649f2f27a24bdf936259dda8ec1e91feca4d12e6f22157835e8c4ecef8e47863ec7689585e5ae93505efd3d0e465a686b2f127641502531f000713c4fbca1f1b3da76392d9807b6433bfb4aec558d53352aa2155112b349e16e5e79b86a0c6bae60f5123706497bc54e8560ac2fdb6d5bb4b154bebdfba21c56350203010001a3533051301d0603551d0e0416041420824c4fed7a96b73fbff15247098ca750c9805d301f0603551d2304183016801420824c4fed7a96b73fbff15247098ca750c9805d300f0603551d130101ff040530030101ff300d06092a864886f70d01010b050003820101002c7bd1e967985a08957775e91da9bdc1f3d46f7ad4897b1667f2a2c31d663ea946a4bcfb2e5cfdf53e0abfeb7b6bf173a215de0f7a1011593ef4fde5354599824508c45d77941dbb5226b036aac125691740d41f654f04646aefb239402483d60460cd99354e6d223dedb0d5710160ddb7a0acb5f5edc119c47bf7f3c8e4541bac4fb1d8816ed22d6a9fc157ed5cd1ac0486ff3b670a36fc8c66cf72fe08d4e3323861d2b506462f295c461a6597ce17ae7ae35232438c6c70a34a7f6eadc67138aedeffe0bed4b98ae04a13fd9143eb2346c82b56350244fd0b4dc443d4b0c94e214f1159b35714df02463a79c35c3adf8f1f7d633980e6658bb13eacd1eb7d \
	ro.build.certs.release.shared=3082041930820301a00302010202142c52f4228228a7672f43e3566d3d9a5ddf711e13300d06092a864886f70d01010b050030819a310b3009060355040613024d54310e300c06035504080c054d616c7461310e300c06035504070c054d616c746131143012060355040a0c0b506978656c4275696c647331143012060355040b0c0b506978656c4275696c64733117301506035504030c0e506978656c4275696c6473526f6d3126302406092a864886f70d0109011617626f6f74696e67706978656c7340676d61696c2e636f6d3020170d3233313130353135323634385a180f32303531303332333135323634385a30819a310b3009060355040613024d54310e300c06035504080c054d616c7461310e300c06035504070c054d616c746131143012060355040a0c0b506978656c4275696c647331143012060355040b0c0b506978656c4275696c64733117301506035504030c0e506978656c4275696c6473526f6d3126302406092a864886f70d0109011617626f6f74696e67706978656c7340676d61696c2e636f6d30820122300d06092a864886f70d01010105000382010f003082010a0282010100a0cff6ef5b27ee1ac9d5abd3b2eef22c6b096e263e3c1843f4ff4140994073cfe3c4281213a115c01419430bcf8d3d81b2cd9cb2b3af7fbf86e415e6a6efb34985ab89d063682b9cf888dcb22cfc6daf080b3ccb5d9f1822aea3a0d20795dd8fa660897ec3d8792d617699ab5af49b9efa9d115305cf703d8aa54eeef9107db95635228e57ca6fcb6368de02ae229a95dfa87d3a1efd0e18a2ce6b801400a517df5156ff07d266de2a1c6dd85540c931503b3bdd4889ebcefcbcd97b65786860d6d44f1b462ba047b7be23889a89f889fbfcffa273e24e8490ea7c20d9be8c86cc5a3dca4620b1230f8383264f7600992171409d0bc0f408b635a612372dafd70203010001a3533051301d0603551d0e041604142587d7cbe96eb6221f2ede6e97f00ea233a585f3301f0603551d230418301680142587d7cbe96eb6221f2ede6e97f00ea233a585f3300f0603551d130101ff040530030101ff300d06092a864886f70d01010b050003820101003ee53599fc28f144f93c42ea516d2d2102855f39a946ffd30675084b91ba56ff3e3f6f164dd89c35aa86a4d47d3c9200f569804ed34c96acad91e53756f2b03df44882cc07884a1eb1fd53c091468fc1f3a1a55c3c3d0284ae171c309d21e8eefbbb871a248bb925b41520d38f7b7e4b770d69fdc0938de3fc187d4594ded768e69e60aeac728f413a8dc20f08bcd01389f313013b89c8a857c07c0c4137955977ce52b8aa9430bae90e9f0b1d925a73e3d7320f9941ff95896600e8f61d0665889ccb18f5c2c3aa1f3346bf270dea25bde34d3f36f7de3b3d3520f5a64ebbd2094c900c5820cf5de8bdbeced8d93da2408bd8eaf2032bd1708ca92a8f31133b \
	ro.build.certs.release.bluetooth=3082041930820301a00302010202147cc941eb7fec5b1c58f396433c1be6b289843339300d06092a864886f70d01010b050030819a310b3009060355040613024d54310e300c06035504080c054d616c7461310e300c06035504070c054d616c746131143012060355040a0c0b506978656c4275696c647331143012060355040b0c0b506978656c4275696c64733117301506035504030c0e506978656c4275696c6473526f6d3126302406092a864886f70d0109011617626f6f74696e67706978656c7340676d61696c2e636f6d3020170d3233313130353135323634325a180f32303531303332333135323634325a30819a310b3009060355040613024d54310e300c06035504080c054d616c7461310e300c06035504070c054d616c746131143012060355040a0c0b506978656c4275696c647331143012060355040b0c0b506978656c4275696c64733117301506035504030c0e506978656c4275696c6473526f6d3126302406092a864886f70d0109011617626f6f74696e67706978656c7340676d61696c2e636f6d30820122300d06092a864886f70d01010105000382010f003082010a02820101009afead5f4e1f56687f09404344ece18c8e8974c0b085193595e294df30b9ef55f8d77bbcc06a49aa9142cd51063749ea3d36b639d6bf9596790cea5a9d9f4f627bed7f3e693dc6c1e9b3651ab5a702c4971f75b2326def95ffab0fd2c5479fa27d88793f07e9bf837ff23dc34a696d046757104bedcce17bcc0c5d5deccfb8986c877814f4594a6db7f27b30f3e0972c5e43ddd333703f632f75f52c3e3c82c19d3efc0fe086fda8f51b74d07ab677d850a20e05e7189f37232be1c900fb23027cf6f1efc757f83fe05db755e1b24d2a8495de0631359e1defd3f7c65d6c0805b2b636345f5ae17ac8f60633abdbd6a5b50a876b656db1d49e51597b338c6ca50203010001a3533051301d0603551d0e04160414b8d96de5353c8c3a1d78330cc64674d2bac014e4301f0603551d23041830168014b8d96de5353c8c3a1d78330cc64674d2bac014e4300f0603551d130101ff040530030101ff300d06092a864886f70d01010b0500038201010094139ae193d4650ad2be07925798834e899fd6fd46bb891e0c945919f45bd22e1f911434f0eef8b5ffb6fa144da6eb1470fe6152fd7c7fd9c2a126819f2fddd859d0b8f17a6a070c99724734af7dc19b0053ab83999d8a37ae5f1d091f03fbbe3340e914d335403ee8821d99e3d338b6dbc7babe3fb90e53d8a2843e99ce9f41430a31499b658e73edc06d2fab9ba2114d97188602c13ab8da4e22e716ec15aee90dced3b4c922635b3c0050826bcadda9833cfb5474d5891f5c3ebccedb7faa6d2ca002b132300166654b5795109283f8638d1c827c1f2fc299040d9a5b7645f52405fd50b2f66cd8d428c5de38856e161ae88cfc60337ed830525ec40abfab \
	ro.build.certs.release.sdk_sandbox=3082041930820301a00302010202143800cc3005e06bd525530604bd38fa914f2ccf58300d06092a864886f70d01010b050030819a310b3009060355040613024d54310e300c06035504080c054d616c7461310e300c06035504070c054d616c746131143012060355040a0c0b506978656c4275696c647331143012060355040b0c0b506978656c4275696c64733117301506035504030c0e506978656c4275696c6473526f6d3126302406092a864886f70d0109011617626f6f74696e67706978656c7340676d61696c2e636f6d3020170d3233313130353135323634375a180f32303531303332333135323634375a30819a310b3009060355040613024d54310e300c06035504080c054d616c7461310e300c06035504070c054d616c746131143012060355040a0c0b506978656c4275696c647331143012060355040b0c0b506978656c4275696c64733117301506035504030c0e506978656c4275696c6473526f6d3126302406092a864886f70d0109011617626f6f74696e67706978656c7340676d61696c2e636f6d30820122300d06092a864886f70d01010105000382010f003082010a0282010100cb09c07f6cc557d3209398d2bd07869a2dc52676041f8de6d5078decd4ba74fb4d814c0ae5b94d7d8f757436a3d3aea381faac61be5678069c6c8ff4bf1e2f5afbed98909fb6b232e043b67277e93d08fafce286aa3cc3ca11ad7a4747adcc9d79764917c8022b69c23389193e6eaab3bc71be7ee59c0b2097e4fab483f58bf885243beebe9b806b40bf805079db3e6bc5659fa6fd3ed4a35efa808bad3523259d8ad9f6ace2e655f12c6f487526d5e5f34281530d8005eebae24231d6616df1c3b4f13d38fc074083ca2eb2df8e31d2ebb6b2cc17c8ab9aaf6d5e43d9655bbbcf3138e1c71d906199a2f08d0257d03eaaeae4556734e6dc345b4e7865f7c4d50203010001a3533051301d0603551d0e041604144b15e9c6e8d799626533f5c568bf442a91c3ce33301f0603551d230418301680144b15e9c6e8d799626533f5c568bf442a91c3ce33300f0603551d130101ff040530030101ff300d06092a864886f70d01010b050003820101009c55afb4d36d870c880cab704b6c3afaad77ed57cc3a263f34c9a46dd17110bd3303dbc24fc29db5c1d32bd660f2ecfe4039c446efe51c192d6dc2a45f7c3afecdd5fe039c44070bbd60975c7e1ca274e268965221c7835dbac0d8a567f8ab2e2f72bbc9783342cb8bd78957d199f3cec328500e6b38d70a9e7a7f935e9b981367ea45e4213bed64e87426fc9b57e2f94709fa5ccb5faa5ce723adedeed3ac11e4a4767bc4435c4d74447cc50395e3e9a7092b8b1f942b4aabc6e4f186ad857278ce1fefef516405d215e3dcba18f771e757f9f175007e884762269eba38097ddc2885cd8580f804991a7ffd8897b0df0367a36c9e30b0913842e6c710f0228c
