# phone-booth

## Setup
1. setup the project: It has a dependecy listed on the pod 'SwiftLint'. On the project root from command promt run 
pod install
2. Again main dependency about the project is that, the taking photo part will only work on physical device. So, a physical device should be connected to run the 'Take a photo' functioning.

## Approach
1. split the problem in different parts such as
    1. UI implementaiton
    2. Decoupling functionality from view which are not not related to UI
    3. seperate the responsibility which are common and make them as a manager
    4. implement the logic to interaction between UI and managers.
3. Write tests, refactoring


## improvments
1. adding more Unit test to check the functionality of collection view.
2. adding end-to-end test to see the screen transition is working fine.

## git commits:

commit d4a263dfed1c5b68aba56b6f34b43bce0b58d460 (HEAD -> main, origin/main, origin/HEAD)
Author: Jerin App <jerinapp@icloud.com>
Date:   Wed Apr 14 11:09:22 2021 +0100

    small UI test

commit 91be9ad62454fe81afc8575a8c5b13e537ab36e4
Author: Jerin App <jerinapp@icloud.com>
Date:   Wed Apr 14 08:51:32 2021 +0100

    added detailsPhotoView

commit 903a79965f276e778185bacaa0d0f23a9a785c23
Author: Jerin App <jerinapp@icloud.com>
Date:   Wed Apr 14 08:36:27 2021 +0100

    configured collectionview for viewing photos

commit f440bdc781f3dcb7f1a0cc0bea66640f5b8926ea
Author: Jerin App <jerinapp@icloud.com>
Date:   Wed Apr 14 08:03:48 2021 +0100

    added viewPhotos view controller

commit 18c961c783f63c01093218d63f01dee093e2a4c0
Author: Jerin App <jerinapp@icloud.com>
Date:   Wed Apr 14 07:39:50 2021 +0100

    added Unit Test for CoreData Repository

commit cd326b3e7b843cf84471833d3b5b2190ed05b596
Author: Jerin App <jerinapp@icloud.com>
Date:   Wed Apr 14 06:49:13 2021 +0100

    added coredata manager to handle interaction with repository

commit f68a2b4c5ebf13690bad845dea1f9817d02337f2
Author: Jerin App <jerinapp@icloud.com>
Date:   Wed Apr 14 06:11:38 2021 +0100

    added CameraManager to TakePhotoView

commit 574b0140057d23a0b899ddacebb48f6ee4571574
Author: Jerin App <jerinapp@icloud.com>
Date:   Wed Apr 14 05:41:46 2021 +0100

    added RoundedCornerButton view

commit e4e0372cfa7e07354205f2fda0bda95327a0504e
Author: Jerin App <jerinapp@icloud.com>
Date:   Wed Apr 14 05:40:03 2021 +0100

    added TakePhotoViewController

commit bd40346735e2782faa68235bf237d6cdf199de46
Author: Jerin App <jerinapp@icloud.com>
Date:   Wed Apr 14 05:36:16 2021 +0100

    implemented mainView functionality
    commit 739d09d4ffd6fc1ff1cc2f619e2d6e0547bfbfb6
Author: Jerin App <jerinapp@icloud.com>
Date:   Wed Apr 14 05:21:57 2021 +0100

    created Photo model for CoreData

commit 49a24d4a3e0a9ad5d193e587a9027c6729d78f0f
Author: Jerin App <jerinapp@icloud.com>
Date:   Wed Apr 14 05:18:51 2021 +0100

    added photoDetails screen

commit 8c8fb1a47a17fe37a133abda658972c4766ff945
Author: Jerin App <jerinapp@icloud.com>
Date:   Wed Apr 14 05:17:45 2021 +0100

    added viewPhotos screen

commit 19297dc20335fbd15782c2452f62869c1ba8004c
Author: Jerin App <jerinapp@icloud.com>
Date:   Wed Apr 14 05:16:44 2021 +0100

    added takePhoto screen

commit 40a071a0be94bd3d28d0eb08704993db4e51b046
Author: Jerin App <jerinapp@icloud.com>
Date:   Wed Apr 14 05:12:48 2021 +0100

    configured main view screen

commit e14e3f5c39eaaaac90d7292690ca906b214fe10f
Author: Jerin App <jerinapp@icloud.com>
Date:   Wed Apr 14 05:06:32 2021 +0100

    configured SwiftLint

commit e21e57a60c1938322b76fd6ab217946d2f655b5d
Author: Jerin App <jerinapp@icloud.com>
Date:   Wed Apr 14 04:59:41 2021 +0100

    initial project setup

commit 19b82689a62d24ae50b234d7d5fbe2de208ba3d8
Author: jamal-ahmed <jamal.ahmed@gmx.net>
Date:   Wed Apr 14 04:54:26 2021 +0100

    Initial commit
