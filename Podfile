platform :ios, '11.0'
use_frameworks!

#link_with 'ABA Music', 'ABA MusicTests'

def abaMusicPods
    #SVProgressHUD
    pod 'SVProgressHUD', '~> 2.2.5'
    
    #Haneke
    pod 'Haneke', '~> 1.0'
end

target 'ABA Music' do
    abaMusicPods
    #I decided to add the RealmSwift in a separated way
    #because an issue appears if I try to use it for UI testing.
    #Realm
    pod 'RealmSwift', '~> 3.13.1'
end

target 'ABA MusicTests' do
    abaMusicPods
    #I decided to add the RealmSwift in a separated way
    #because an issue appears if I try to use it for UI testing.
    #Realm
    pod 'RealmSwift', '~> 3.13.1'
end

target 'ABA MusicUITests' do
    abaMusicPods
end
