require 'rails_helper'

describe Admin::CaseStudyGalleryImagesController do
  context 'with a signed in user' do
    before do
      sign_in create(:user)
    end

    context 'with a case study image' do
      let(:case_study_gallery_image) { create(:case_study_gallery_image) }

      describe '#edit' do
        context 'with a valid case study gallery image' do
          before do
            get :edit, id: case_study_gallery_image.id.to_s
          end

          it 'returns a 200 status code' do
            expect(response.code).to eq('200')
          end

          it 'creates a @case_study_gallery_image variable' do
            var = controller.instance_variable_get(:@case_study_gallery_image)
            expect(var).not_to be_nil
          end
        end

        context 'with an invalid id' do
          it 'raises an error' do
            expect do
              get :edit, id: 1000
            end.to raise_error(ActionController::RoutingError)
          end
        end
      end

      describe '#update' do
        let(:title) { 'Megafone - An online phone repair store.' }
        let(:image) { File.open('spec/support/files/mega_fone.png') }

        let(:params) do
          {
            title: title,
            image: image
          }
        end

        context 'with a valid id' do
          before do
            post :update,
                 id: case_study_gallery_image.id,
                 case_study_gallery_image: params
          end

          it 'renders the show template' do
            image = case_study_gallery_image
            path = edit_admin_case_study_gallery_image_path(image)
            expect(response).to redirect_to(path)
          end

          it 'populates @case_study_gallery_image correctly' do
            var = controller.instance_variable_get(:@case_study_gallery_image)
            expect(var).to be_a(CaseStudyGalleryImage)
          end

          it 'creates a success notice' do
            expect(flash[:notice]).not_to be_nil
          end
        end

        context 'with an invalid id' do
          it 'raises an error' do
            expect do
              post :update, id: 1000, case_study_gallery_image: params
            end.to raise_error(ActionController::RoutingError)
          end
        end
      end
    end
  end
end
