require 'rails_helper'

describe Admin::ProjectsController do
  it_behaves_like 'an authenticated controller', 'index'
  it_behaves_like 'an authenticated controller', 'new'

  describe 'with a logged in user' do
    before do
      sign_in create(:user)
    end

    describe '#index' do
      before do
        5.times { create(:project) }

        get :index
      end

      it 'populates @projects with the correct number of projects' do
        projects = controller.instance_variable_get(:@projects)
        expect(projects.size).to eq(5)
      end
    end

    describe '#new' do
      before do
        get :new
      end

      it 'creates a new Project and assigns it to @project' do
        project = controller.instance_variable_get(:@project)

        expect(project.class).to eq(Project)
        expect(project.new_record?).to be_truthy
      end
    end

    describe '#show' do
      let(:project) { create(:project) }

      context 'with a valid id' do
        before do
          get :show, id: project.id
        end

        it 'renders the show template' do
          expect(response).to render_template('admin/projects/show')
        end

        it 'populates @project correctly' do
          instance_project = controller.instance_variable_get(:@project)
          expect(instance_project).to eq(project)
        end
      end

      context 'with an invalid id' do
        it 'raises an error' do
          expect {
            get :show, id: 1000
          }.to raise_error(ActionController::RoutingError)
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
        it 'creates a new Project with the details' do
          count = Project.count

          post :create, project: params

          expect(Project.count).to eq(count+1)
        end

        it 'saves the given details to a new Project' do
          post :create, project: params

          project = Project.last

          expect(project.title).to eq(title)
          expect(project.intro).to eq(intro)
          expect(project.body).to  eq(body)
        end

        it 'redirects the user to the project index page' do
          post :create, project: params

          project = controller.instance_variable_get(:@project)

          expect(response).to redirect_to(admin_project_url(project))
        end
      end

      context 'with incorrect params' do
        let(:title) { nil }

        before do
          post :create, project: params

          @project = controller.instance_variable_get(:@project)
        end

        it 'renders the edit page' do
          expect(response).to have_rendered('admin/projects/edit')
        end

        it 'populates error messages' do
          expect(@project.errors).not_to be_nil
        end
      end
    end

    describe '#edit' do
      let(:project) { create(:project) }

      context 'with a valid id' do
        before do
          get :edit, id: project.id
        end

        it 'renders the edit template' do
          expect(response).to render_template('admin/projects/edit')
        end

        it 'populates @project correctly' do
          instance_project = controller.instance_variable_get(:@project)
          expect(instance_project).to eq(project)
        end
      end

      context 'with an invalid id' do
        it 'raises an error' do
          expect {
            get :show, id: 1000
          }.to raise_error(ActionController::RoutingError)
        end
      end
    end

    describe '#update' do
      let(:project) { create(:project) }

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

      context 'with a valid id' do
        before do
          post :update, id: project.id, project: params
        end

        it 'renders the show template' do
          expect(response).to redirect_to(admin_project_path(project.id))
        end

        it 'populates @project correctly' do
          instance_project = controller.instance_variable_get(:@project)
          expect(instance_project).to be_a(Project)
        end
      end

      context 'with an invalid id' do
        it 'raises an error' do
          expect {
            post :update, id: 1000, project: params
          }.to raise_error(ActionController::RoutingError)
        end
      end
    end

    describe '#destroy' do
      before do
        create(:project, id: 1)
      end

      context 'with a valid id' do
        it 'renders the show template' do
          delete :destroy, id: 1

          expect(response).to redirect_to(admin_projects_path)
        end

        it 'populates @project correctly' do
          count = Project.count
          delete :destroy, id: 1
          expect(Project.count).to eq(count-1)
        end
      end

      context 'with an invalid id' do
        it 'raises an error' do
          expect {
            delete :destroy, id: 1000
          }.to raise_error(ActionController::RoutingError)
        end
      end
    end
  end
end