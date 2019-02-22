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
    #Realm
    pod 'RealmSwift', '~> 3.13.1'
end

target 'ABA MusicTests' do
    abaMusicPods
    #Realm
    pod 'RealmSwift', '~> 3.13.1'
end

target 'ABA MusicUITests' do
    abaMusicPods
end
