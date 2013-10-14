# encoding: utf-8

User.create!(:email => 'toughjjh@gmail.com',:name=>'잠자는-사자',:password => '123456', :password_confirmation => '123456',:description=>'살인자 은행 망해라!!',:admin=>1)

Notice.create!(:id=>1,:user_id=>1,:title=>'예쁘고 귀여운 수정이의 집이 다시 개장했습니다.')
NoticeContent.create!(:id=>1,:content=>'그동안 수많은 방문자에 비해서 준비되지 못하였는데 이제 보다 업그레이드된 모습으로 다시 찾아뵙게되었습니다.
수정이와 소통하는 공간으로 계속 많은 이용바랍니다.')

GalleryCategory.create!(:title=>'수정이')
GalleryCategory.create!(:title=>'종호')
GalleryCategory.create!(:title=>'멍멍이')
GalleryCategory.create!(:title=>'풍경')    

FaqCategory.create!(:id=>1,:title=>'주한미군')
FaqCategory.create!(:id=>2,:title=>'주한미군')
FaqCategory.create!(:id=>3,:title=>'주한미군')
FaqCategory.create!(:id=>4,:title=>'주한미군') 
Faq.create!(:faq_category_id=>1,:id=>1,:title=>'주한미군의 주요 활동?')
Faq.create!(:faq_category_id=>1,:id=>2,:title=>'주한미군의 왜 떠나지 않을까요?')
Faq.create!(:faq_category_id=>1,:id=>3,:title=>'미국은 한국에 군대를 주둔시킴으로써 어떤 이익이 있나요?')     
Faq.create!(:faq_category_id=>1,:id=>4,:title=>'한국은 미군이 주둔함으로써 어떤 이익이 있나요?')
Faq.create!(:faq_category_id=>1,:id=>5,:title=>'한국은 미군 주둔으로 어떤 손해를 보고 있나요?')
Faq.create!(:faq_category_id=>1,:id=>6,:title=>'상황이 이런데 한국민들은 왜 미군을 철수시키지 않나요?')
FaqContent.create!(:id=>1,:content=>'남북한간의 긴장조성, 대화및 통일 방해, 남한의 무기체계 독점, 각종범죄, 환경파괴')
FaqContent.create!(:id=>2,:content=>'미군의 한국 주둔이 미국의 이익에 부합되지 않는다면 그들은 우리가 아무리 머물러 달라고 하여도 당장 떠날것입니다.
하지만 미군의 한국주둔이 엄청난 이익이 있기 때문에 무려 60년동안 주둔하면서 아직도 떠날 생각을 하지 않고 있는것입니다.
이제 우리가 나서지 않는다면 그들은 결코 떠나지 않을것이며 외국군대의 100년 주둔이라는 반만년 역사에 없던 수치를 후손들에게 물려줄지도 모릅니다..')
FaqContent.create!(:id=>3,:content=>'중국견제의 핵심적 요충지 주둔, 남북한 긴장 조성을 통한 무기 고가판매(독점판매), 주둔비용 전가를 통한 비용절감, 각종 폐기물 비용없이 처리') 
FaqContent.create!(:id=>4,:content=>'없습니다.') 
FaqContent.create!(:id=>5,:content=>'북한,중국과의 관계개선 방해, 무기체계 독점으로 인한 고가구입, 미군주둔비용 부담, 미군주둔 토지 사용 못함, 미군범죄에의 노출로 민간인들 피해, 미군의 환경파괴로 인한 국토 오염 피해.')
FaqContent.create!(:id=>6,:content=>'미국의 지배가 60년간 이어오면서 지배계층은 미국에의 비호를 받으며 자신들의 이익을 실현하고 있으며 이 상황유지를 위하여 언론을 통해 긴장을 조성하고 미군주둔의 정당성을 부여함으로서 국민들을 세뇌시키고 있습니다. ') 
