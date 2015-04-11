require 'rails_helper'

describe Admin::CaseStudiesController do
  it_behaves_like 'an authenticated controller', 'index'
  it_behaves_like 'an authenticated controller', 'new'

  describe 'with a logged in user' do
    before do
      sign_in create(:user)
    end

    describe '#index' do
      before do
        5.times { create(:case_study) }

        get :index
      end

      it 'populates @case_studies with the correct number of case_studies' do
        case_studies = controller.instance_variable_get(:@case_studies)
        expect(case_studies.size).to eq(5)
      end
    end

    describe '#new' do
      before do
        get :new
      end

      it 'creates a new CaseStudy and assigns it to @case_study' do
        case_study = controller.instance_variable_get(:@case_study)

        expect(case_study.class).to eq(CaseStudy)
        expect(case_study.new_record?).to be_truthy
      end
    end

    describe '#show' do
      let(:case_study) { create(:case_study) }

      context 'with a valid id' do
        before do
          get :show, id: case_study.id
        end

        it 'renders the show template' do
          expect(response).to render_template('admin/case_studies/show')
        end

        it 'populates @case_study correctly' do
          instance_case_study = controller.instance_variable_get(:@case_study)
          expect(instance_case_study).to eq(case_study)
        end
      end

      context 'with an invalid id' do
        it 'raises an error' do
          expect do
            get :show, id: 1000
          end.to raise_error(ActionController::RoutingError)
        end
      end
    end

    describe '#create' do
      let(:title) { 'Give Cat' }
      let(:intro) { 'A little intro' }
      let(:body)  { 'A body' }

      let(:params) do
        {
          title: title,
          intro: intro,
          body:  body
        }
      end

      context 'with params set' do
        it 'creates a new CaseStudy with the details' do
          count = CaseStudy.count

          post :create, case_study: params

          expect(CaseStudy.count).to eq(count + 1)
        end

        it 'saves the given details to a new CaseStudy' do
          post :create, case_study: params

          case_study = CaseStudy.last

          expect(case_study.title).to eq(title)
          expect(case_study.intro).to eq(intro)
          expect(case_study.body).to eq(body)
        end

        it 'redirects the user to the case study page' do
          post :create, case_study: params

          case_study = controller.instance_variable_get(:@case_study)

          expect(response).to redirect_to(admin_case_study_path(case_study))
        end
      end

      context 'with incorrect params' do
        let(:title) { nil }

        before do
          post :create, case_study: params

          @case_study = controller.instance_variable_get(:@case_study)
        end

        it 'renders the new page' do
          expect(response).to have_rendered('admin/case_studies/new')
        end

        it 'populates error messages' do
          expect(@case_study.errors).not_to be_nil
        end
      end
    end

    describe '#edit' do
      let(:case_study) { create(:case_study) }

      context 'with a valid id' do
        before do
          get :edit, id: case_study.id
        end

        it 'renders the edit template' do
          expect(response).to render_template('admin/case_studies/edit')
        end

        it 'populates @case_study correctly' do
          instance_case_study = controller.instance_variable_get(:@case_study)
          expect(instance_case_study).to eq(case_study)
        end
      end

      context 'with an invalid id' do
        it 'raises an error' do
          expect do
            get :show, id: 1000
          end.to raise_error(ActionController::RoutingError)
        end
      end
    end

    describe '#update' do
      let(:case_study)        { create(:case_study) }
      let(:gallery_images) do
        [
          create(:case_study_gallery_image,
                 title: 'First image',
                 case_study: case_study),
          create(:case_study_gallery_image,
                 title: 'Second image',
                 case_study: case_study)
        ]
      end

      let(:title) { 'Give Cat' }
      let(:intro) { 'A little intro' }
      let(:body)  { 'A body' }
      let(:gallery_image_attributes) do
        {
          '0' => { id: gallery_images.first.id, remove_image: '1' },
          '1' => { id: gallery_images.last.id, remove_image: '0' }
        }
      end

      let(:params) do
        {
          title:                     title,
          intro:                     intro,
          body:                      body,
          gallery_images_attributes: gallery_image_attributes
        }
      end

      context 'with a valid id' do
        before do
          post :update, id: case_study.id, case_study: params
        end

        it 'renders the show template' do
          expect(response).to redirect_to(admin_case_study_path(case_study.id))
        end

        it 'populates @case_study correctly' do
          instance_case_study = controller.instance_variable_get(:@case_study)
          expect(instance_case_study).to be_a(CaseStudy)
        end

        it 'successfully removes one of the images' do
          instance_case_study = controller.instance_variable_get(:@case_study)
          expect(instance_case_study.gallery_images.size).to eq(1)
        end
      end

      context 'with an invalid id' do
        it 'raises an error' do
          expect do
            post :update, id: 1000, case_study: params
          end.to raise_error(ActionController::RoutingError)
        end
      end
    end

    describe '#destroy' do
      before do
        create(:case_study, id: 1)
      end

      context 'with a valid id' do
        it 'renders the show template' do
          delete :destroy, id: 1

          expect(response).to redirect_to(admin_case_studies_path)
        end

        it 'successfully deletes a CaseStudy' do
          count = CaseStudy.count
          delete :destroy, id: 1
          expect(CaseStudy.count).to eq(count - 1)
        end
      end

      context 'with an invalid id' do
        it 'raises an error' do
          expect do
            delete :destroy, id: 1000
          end.to raise_error(ActionController::RoutingError)
        end
      end
    end
  end
end
