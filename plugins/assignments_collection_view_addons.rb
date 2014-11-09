module AssignmentsCollectionViewAddons
  def with_deliverables
    all.select {|assn| assn.data.include? 'deliverables'}
  end

  def weeks
    all.map{|a| Integer(a.due.gsub(/week/,''))}.sort.uniq.reverse
  end

  def pretty_deliverable(type)
    ruhoh.collection('data').deliverables[type]
  end

  def assignment_link(a)
    t = a["tags"].first["name"]
    if(t.start_with?("week"))
      wid = sprintf("%02d", Integer(t.gsub(/week/,''))) + ".md"
      week = ruhoh.collection('weeks').all.select{|w| w.id == wid}.first
      return week.url + "#assignments"
    else
      t = a['assigned']
      wid = sprintf("%02d", Integer(t.gsub(/week/,''))) + ".md"
      week = ruhoh.collection('weeks').all.select{|w| w.id == wid}.first
      return week.url + "#assignments"
    end
  end

  def by_week
    r_weeks = []
    assns = with_deliverables
    date = Date.parse(ruhoh.collection('data').first_date)
    self.weeks.each do |w|
      pretty_week = "Week #{w}: " + (date + 7 * (w - 1)).strftime("%B %-d, %Y")
      r_assn = []
      assns.each do |a|
        a.deliverables.select{|d| d['due']=="week#{w}"}.each do |d|
          r_assn.push({
            "assignment" => a,
            "type" => d['type'],
            "name" => "#{a['name']}",
            "type_info" => pretty_deliverable(d['type']),
            "week_assigned" => assignment_link(a)
          })
        end
      end
      if !r_assn.empty?
        r_weeks.push({
          "assignments" => r_assn.sort{|a,b| a['type'] <=> b['type']},
          "week" => "week#{w}",
          "pretty_week" => pretty_week
        })
      end
    end
    r_weeks
  end
end
Ruhoh.collection('assignments').send(:include, AssignmentsCollectionViewAddons)
