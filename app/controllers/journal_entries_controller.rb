class JournalEntriesController < ApplicationController
  before_action :set_goal_and_task, except: [:show, :index]

  def index
    @goal = Goal.find(params[:goal_id])
    @journal_entries = @goal.journal_entries
  end

  def show
    @journal_entry = JournalEntry.find(params[:id])
  end

  def new
    # @goal = Goal.find(params[:goal_id])
    # @task = Task.find(params[:task_id])
    @journal_entry = JournalEntry.new
  end

  def create
    # @journal_entry = @task.journal_entries.build(journal_entry_params)
    @journal_entry = JournalEntry.new(journal_entry_params)
    @journal_entry.task = @task
    @journal_entry.save
    if @journal_entry.save
      redirect_to journal_entry_path(@journal_entry), notice: 'Journal entry was successfully created.'
    else
      render :new
    end
  end

  def edit
    @journal_entry = @goal.journal_entries.find(params[:id])
  end

  def update
    @journal_entry = @task.journal_entries.find(params[:id])

    if @journal_entry.update(journal_entry_params)
      redirect_to goal_task_journal_entry_path(@goal, @task, @journal_entry), notice: 'Journal entry was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @journal_entry = @goal.journal_entries.find(params[:id])
    @journal_entry.destroy
    redirect_to goal_task_journal_entries_path(@goal, @task), notice: 'Journal entry was successfully deleted.'
  end

  private

  def set_goal_and_task
    @goal = Goal.find(params[:goal_id])
    @task = Task.find(params[:task_id])
  end

  def journal_entry_params
    params.require(:journal_entry).permit(:entry_text, :entry_date, :goal_id, :task_id)
  end
end
