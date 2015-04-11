require 'rails_helper'

describe Admin::CurriculumVitaesController do
  context 'with a signed in user' do
    before do
      sign_in create(:user)
    end

    describe '#new' do
      before do
        get :new
      end

      it 'creates a new CaseStudy and assigns it to @curriculum_vitae' do
        cv = controller.instance_variable_get(:@curriculum_vitae)

        expect(cv.class).to eq(CurriculumVitae)
        expect(cv.new_record?).to be_truthy
      end
    end

    describe '#create' do
      let(:note) { 'A pink CV' }
      let(:file) do
        Rack::Test::UploadedFile.new(
          File.join(Rails.root, 'spec', 'support', 'files', 'test_pdf.pdf')
        )
      end

      let(:params) do
        {
          note: note,
          file: file
        }
      end

      before do
        post :create, curriculum_vitae: params
      end

      context 'with a file' do
        it 'creates a new CurriculumVitae' do
          cv = CurriculumVitae.last
          expect(cv.note).to eq(note)
          expect(cv.file.url).to include(file.original_filename)
        end
      end
    end

    describe '#index' do
      before do
        5.times { create(:curriculum_vitae) }

        get :index
      end

      it 'populates @curriculum_vitaes with the correct number of items' do
        cvs = controller.instance_variable_get(:@curriculum_vitaes)
        expect(cvs.size).to eq(5)
      end
    end

    context 'with a CV' do
      let(:curriculum_vitae) { create(:curriculum_vitae) }

      describe '#show' do
        before do
          get :show, id: curriculum_vitae.id
        end

        it 'renders the show template' do
          expect(response).to render_template('admin/curriculum_vitaes/show')
        end

        it 'populates @curriculum_vitae correctly' do
          cv = controller.instance_variable_get(:@curriculum_vitae)
          expect(cv).to eq(curriculum_vitae)
        end
      end

      describe '#edit' do
        context 'with a valid case study gallery image' do
          before do
            get :edit, id: curriculum_vitae.id
          end

          it 'returns a 200 status code' do
            expect(response.code).to eq('200')
          end

          it 'creates a @curriculum_vitae variable' do
            var = controller.instance_variable_get(:@curriculum_vitae)
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
        let(:note) { 'A pink CV' }
        let(:file) { File.open('spec/support/files/pink_pdf.pdf') }

        let(:params) do
          {
            note: note,
            file: file
          }
        end

        context 'with a valid id' do
          before do
            post :update, id: curriculum_vitae.id, curriculum_vitae: params
          end

          it 'renders the show template' do
            path = edit_admin_curriculum_vitae_path(curriculum_vitae.id)
            expect(response).to redirect_to(path)
          end

          it 'populates @case_study_gallery_image correctly' do
            var = controller.instance_variable_get(:@curriculum_vitae)
            expect(var).to be_a(CurriculumVitae)
          end

          it 'creates a success notice' do
            expect(flash[:notice]).not_to be_nil
          end
        end

        context 'with an invalid id' do
          it 'raises an error' do
            expect do
              post :update, id: 1000, curriculum_vitae: params
            end.to raise_error(ActionController::RoutingError)
          end
        end
      end

      describe '#destroy' do
        it 'successfully removes the CV' do
          cv = create(:curriculum_vitae)

          cv_count = CurriculumVitae.count

          delete :destroy, id: cv.id

          expect(CurriculumVitae.count).to eq(cv_count - 1)
        end
      end
    end
  end
end
