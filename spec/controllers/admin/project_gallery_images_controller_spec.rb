require 'rails_helper'

describe Admin::ProjectGalleryImagesController do
  context 'with a signed in user' do
    before do
      sign_in create(:user)
    end

    context 'with a project image' do
      let(:project_gallery_image) { create(:project_gallery_image) }

      describe '#edit' do
        context 'with a valid project gallery image' do
          before do
            get :edit, id: project_gallery_image.id.to_s
          end

          it 'returns a 200 status code' do
            expect(response.code).to eq('200')
          end

          it 'creates a @project_gallery_image variable' do
            instace_variable = controller.instance_variable_get(:@project_gallery_image)
            expect(instace_variable).not_to be_nil
          end
        end

          context 'with an invalid id' do
          it 'raises an error' do
            expect {
              get :edit, id: 10000
            }.to raise_error(ActionController::RoutingError)
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
            post :update, id: project_gallery_image.id, project_gallery_image: params
          end

          it 'renders the show template' do
            expect(response).to redirect_to(edit_admin_project_gallery_image_path(project_gallery_image.id))
          end

          it 'populates @project_gallery_image correctly' do
            instance_image = controller.instance_variable_get(:@project_gallery_image)
            expect(instance_image).to be_a(ProjectGalleryImage)
          end

          it 'creates a success notice' do
            expect(flash[:notice]).not_to be_nil
          end
        end

        context 'with an invalid id' do
          it 'raises an error' do
            expect {
              post :update, id: 1000, project_gallery_image: params
            }.to raise_error(ActionController::RoutingError)
          end
        end
      end
    end
  end
end