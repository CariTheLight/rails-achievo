class JournalEntriesController < ApplicationController
  before_action :set_goal_and_task, only: [:new, :create]

  def index
    @goal = Goal.find(params[:goal_id])
    # @tasks = @goal.tasks
    @journal_entries = @goal.journal_entries
  end

  def show
    @journal_entry = JournalEntry.find(params[:id])
  end

  def new
    @task = Task.find(params[:task_id])
    @journal_entry = JournalEntry.new
    @goal = @task.goal
  end

  def create
    # @journal_entry = @task.journal_entries.build(journal_entry_params)
    @journal_entry = JournalEntry.new(journal_entry_params)
    @journal_entry.task = @task
    @journal_entry.entry_date = Date.today
    # @journal_entry.save
    if @journal_entry.save
      redirect_to journal_entry_path(@journal_entry), notice: 'Journal entry was successfully created.'
    else
      render :new
    end
  end

  def edit
    # @goal = Goal.find(params[:goal_id])
    # @task = Task.find(params[:task_id])
    @journal_entry = JournalEntry.find(params[:id])
  end

  def update
    @journal_entry = JournalEntry.find(params[:id])

    if @journal_entry.update(journal_entry_params)
      @journal_entry.update(entry_date: Date.today)
      redirect_to goal_journal_entries_path(@journal_entry.task.goal), notice: 'Journal entry was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @journal_entry = JournalEntry.find(params[:id])
    @journal_entry.destroy
    redirect_to task_journal_entries_path(@journal_entry.task.goal, @journal_entry.task), notice: 'Journal entry was successfully deleted.'
  end


  private

  def set_goal_and_task
    # @goal = Goal.find(params[:goal_id])
    @task = Task.find(params[:task_id])
  end

  def journal_entry_params
    params.require(:journal_entry).permit(:entry_text, :entry_date, :goal_id, :task_id)
  end
end
