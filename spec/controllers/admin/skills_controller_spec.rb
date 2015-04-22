require 'rails_helper'

RSpec.describe Admin::SkillsController, type: :controller do
  it_behaves_like 'an authenticated controller', 'index'
  it_behaves_like 'an authenticated controller', 'new'

  describe 'with a logged in user' do
    before do
      sign_in create(:user)
    end

    describe '#index' do
      before do
        5.times { create(:skill) }

        get :index
      end

      it 'populates @skills with the correct number of skills' do
        skills = controller.instance_variable_get(:@skills)
        expect(skills.size).to eq(5)
      end
    end

    describe '#new' do
      before do
        get :new
      end

      it 'creates a new Skill and assigns it to @skill' do
        skill = controller.instance_variable_get(:@skill)

        expect(skill.class).to eq(Skill)
        expect(skill.new_record?).to be_truthy
      end
    end

    describe '#create' do
      let(:title) { 'Ruby' }
      let(:level) { 95.97 }
      let(:svg_uploader) do
        file = File.open('spec/support/files/ruby_logo.svg')
        Rack::Test::UploadedFile.new(file)
      end
      let(:image_uploader) do
        file = File.open('spec/support/files/ruby_logo.png')
        Rack::Test::UploadedFile.new(file)
      end

      let(:params) do
        {
          title: title,
          level: level,
          svg_logo: svg_uploader,
          image_logo: image_uploader
        }
      end

      context 'with params set' do
        it 'creates a new Skill with the details' do
          count = Skill.count

          post :create, skill: params

          expect(Skill.count).to eq(count + 1)
        end

        it 'saves the given details to a new Skill' do
          post :create, skill: params

          skill = Skill.last

          expect(skill.title).to eq(title)
          expect(skill.level).to eq(level)
        end

        it 'redirects the user to the skill page' do
          post :create, skill: params

          skill = controller.instance_variable_get(:@skill)

          expect(response).to redirect_to(admin_skill_path(skill))
        end
      end

      context 'with incorrect params' do
        let(:title) { nil }

        before do
          post :create, skill: params

          @skill = controller.instance_variable_get(:@skill)
        end

        it 'renders the edit page' do
          expect(response).to have_rendered('admin/skills/new')
        end

        it 'populates error messages' do
          expect(@skill.errors).not_to be_nil
        end
      end
    end

    describe '#show' do
      before do
        @skill = create(:skill)

        get :show, id: @skill.id
      end

      it 'assigns the @skill instance variable' do
        skill = controller.instance_variable_get(:@skill)

        expect(skill).to eq(@skill)
      end
    end

    describe '#edit' do
      let(:skill) { create(:skill) }

      before do
        get :edit, id: skill.id
      end

      it 'populates the @skill instance variable' do
        instance_skill = controller.instance_variable_get(:@skill)

        expect(instance_skill.class).to eq(Skill)
        expect(instance_skill).to eq(skill)
      end

      it 'raises an error if the id is invalid' do
        expect do
          delete :edit, id: 1000
        end.to raise_error(ActionController::RoutingError)
      end
    end

    describe '#update' do
      let(:title) { 'PHP' }
      let(:level) {   53.4 }

      let(:params) do
        {
          title: title,
          level: level
        }
      end

      let(:skill) { create(:skill) }

      context 'with a valid skill id' do
        before do
          patch :update, id: skill.id, skill: params
        end

        it 'renders the show template' do
          expect(response).to redirect_to(admin_skill_path(skill))
        end

        it 'populates @skill correctly' do
          instance_skill = controller.instance_variable_get(:@skill)
          expect(instance_skill).to be_a(Skill)
        end

        it 'successfully updates the skill' do
          updated_skill = Skill.find(skill.id)

          expect(updated_skill.title).to eq(title)
          expect(updated_skill.level).to eq(level)
        end
      end
    end

    describe '#destroy' do
      before do
        @skill = create(:skill)
      end

      it 'redirects to the index page' do
        delete :destroy, id: @skill.id
        expect(response).to redirect_to(admin_skills_path)
      end

      it 'successfully removes a skill' do
        skill_count = Skill.count

        delete :destroy, id: @skill.id

        expect(Skill.count).to eq(skill_count - 1)
      end
    end
  end
end
