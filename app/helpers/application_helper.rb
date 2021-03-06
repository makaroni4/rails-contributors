# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_commit_in_github(commit)
    link_to content_tag(:span, commit.short_sha1, class: 'sha1'), commit.github_url, class: 'commit'
  end

  def link_to_release_in_github(release)
    link_to content_tag(:span, release.tag, class: 'tag'), release.github_url, class: 'tag'
  end

  def link_to_contributor(contributor)
    link_to contributor.name, contributor_commits_path(contributor)
  end

  def link_to_release(release)
    link_to release.name, release_contributors_path(release)
  end

  def add_window_to(title, time_window)
    time_window ||= 'all-time'
    "#{title} - #{TimeConstraints.label_for(time_window)}".html_safe
  end

  def sidebar_tab(name, current, options={}, html_options={})
    li_options = current ? {class: 'current'} : {}
    content_tag :li, li_options do
      link_to name, options, html_options
    end
  end

  def normalize_title(title)
    title = title.starts_with?('Rails Contributors') ? title : "Rails Contributors - #{title}"
    strip_tags(title)
  end
end
